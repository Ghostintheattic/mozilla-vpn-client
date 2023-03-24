#! /usr/bin/env python3
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

import argparse
import xml.etree.ElementTree as ET
import os
import sys
import shutil
import atexit
import subprocess

# Use the project root as the working directory
prevdir = os.getcwd()
workdir = os.path.join(os.path.dirname(__file__), '..', '..')
os.chdir(workdir)
atexit.register(os.chdir, prevdir)

# Include only locales above this threshold (e.g. 70%) in production
l10n_threshold = 0.70

parser = argparse.ArgumentParser()
parser.add_argument(
    '-m', '--macos', default=False, action="store_true", dest="ismacos",
    help='Include the MacOS bundle data')
parser.add_argument(
    '-q', '--qt_path',  default=None, dest="qtpath",
    help='The QT binary path. If not set, we try to guess.')
args = parser.parse_args()

stepnum = 1
def title(text):
    global stepnum
    print(f"\033[96m\033[1mStep {stepnum}\033[0m: \033[97m{text}\033[0m")
    stepnum = stepnum+1

# Step 1
title("Find the Qt localization tools...")
def qtquery(qmake, propname):
    try:
        qtquery = os.popen(f'{qmake} -query {propname}')
        qtpath = qtquery.read().strip()
        if len(qtpath) > 0:
            return qtpath
    finally:
        pass
    return None

qtbinpath = args.qtpath
if qtbinpath is None:
  qtbinpath = qtquery('qmake', 'QT_INSTALL_BINS')
if qtbinpath is None:
    qtbinpath = qtquery('qmake6', 'QT_INSTALL_BINS')
if qtbinpath is None:
    print('Unable to locate qmake tool.')
    sys.exit(1)

if not os.path.isdir(qtbinpath):
    print(f"QT path is not a diretory: {qtbinpath}")
    sys.exit(1)

lupdate = os.path.join(qtbinpath, 'lupdate')
lconvert = os.path.join(qtbinpath, 'lconvert')
lrelease = os.path.join(qtbinpath, 'lrelease')

for project in os.listdir(os.path.join('src', 'apps')):
    title(f"Project {project}")

    l10n_files = []

    projectname = project
    i18ntemplate = os.path.join('src', 'apps', project, 'translations', 'template')
    if os.path.isfile(i18ntemplate):
        with open(i18ntemplate) as f:
            projectname = f.read().strip()

    i18ndir = os.path.join('src', 'apps', project, 'translations', 'i18n')

    if os.path.isdir(i18ndir):
        # Step 1 (continued)
        # Get the latest translations from i18n remote
        os.system(f"git submodule update --init --remote --depth 1 {i18ndir}")

        # Step 2
        # Go through the i18n repo, check each XLIFF file and take
        # note which locale is complete above the minimum threshold.
        # Adds path of .xliff and .ts to l10n_files.
        title("Validate the XLIFF file...")
        for locale in os.listdir(i18ndir):
            # Skip non folders
            if not os.path.isdir(os.path.join(i18ndir, locale)):
                continue

            # Skip hidden folders
            if locale.startswith('.'):
                continue

            xliff_path = os.path.join(i18ndir, locale, f"{projectname}.xliff")

            # If it's the source locale (en), ignore parsing for completeness and
            # add it to the list.
            if locale == 'en':
                print(f'OK\t- en added (reference locale)')
                l10n_files.append({
                    'locale': 'en',
                    'ts': os.path.join('translations', 'generated', project, f"{projectname}_en.ts"),
                    'xliff': xliff_path,
                    'completeness': 1.0
                })
                continue

            tree = ET.parse(xliff_path)
            root = tree.getroot()

            sources = 0
            translations = 0

            for element in root.iter('{urn:oasis:names:tc:xliff:document:1.2}source'):
                sources += 1
            for element in root.iter('{urn:oasis:names:tc:xliff:document:1.2}target'):
                translations += 1

            completeness = translations/(sources*1.0)

            print(f'- {locale} added ({round(completeness*100, 2)}% translated)')
            l10n_files.append({
                'locale': locale,
                'ts': os.path.join('translations', 'generated', project, f'{projectname}_{locale}.ts'),
                'xliff': xliff_path,
                'completeness': completeness
            })

    # Step 3
    title("Creating output directory...")
    gendir = os.path.join('translations', 'generated', project)
    os.makedirs(gendir, exist_ok=True)

    # Step 4
    title("Write the translations.completeness file...")
    with open(os.path.join(gendir, 'translations.completeness'), 'w') as file:
        for l10n_file in l10n_files:
            file.write(f'{l10n_file["locale"]}:{l10n_file["completeness"]}\n')

    # Step 5
    title("Write resource file to import the locales...")
    with open(os.path.join(gendir, 'translations.qrc'), 'w') as qrcfile:
        qrcfile.write('<!-- AUTOGENERATED! DO NOT EDIT!! -->\n')
        qrcfile.write('<RCC>\n')
        qrcfile.write('    <qresource prefix="/i18n">\n')
        qrcfile.write('      <file>translations.completeness</file>\n')
        for file in l10n_files:
            qrcfile.write(f'        <file>{projectname}_{file["locale"]}.qm</file>\n')

        extradir = os.path.join('src', 'apps', project, 'translations', 'extras')
        if os.path.isdir(extradir):
            for extra in os.listdir(extradir):
                qrcfile.write(f'      <file alias="{extra}">{os.path.join(os.getcwd(), extradir, extra)}</file>\n')

        qrcfile.write('    </qresource>\n')
        qrcfile.write('</RCC>\n')

    # Step 6
    title("Generate the Js/C++ string definitions...")
    try:
        subprocess.call([sys.executable, os.path.join('scripts', 'utils', 'generate_strings.py'),
                         '-o', gendir, os.path.join('src', 'apps', project, 'translations', 'strings.yaml')])
    except Exception as e:
        print("generate_strings.py failed. Try with:\n\tpip3 install -r requirements.txt --user")
        print(e)
        exit(1)

    # Step 7
    # Build a dummy project to glob together everything that might contain strings
    title("Scanning for new strings...")
    with open(os.path.join('translations', 'generated', project, 'dummy_language.pro'), 'w') as dummyproj:
        dummyproj.write('### AUTOGENERATED! DO NOT EDIT!! ###\n')
        dummyproj.write(f"HEADERS += i18nstrings.h\n")
        dummyproj.write(f"SOURCES += i18nstrings_p.cpp\n")
        dummyproj.write(f"SOURCES += ../../i18nstrings.cpp\n\n")
        for l10n_file in l10n_files:
            dummyproj.write(f"TRANSLATIONS += {os.path.basename(l10n_file['ts'])}\n")

        dummyproj.write("\n")
        dummyproj.write(f"HEADERS += $$files(../../../src/shared/*.h, true)\n")
        dummyproj.write(f"HEADERS += $$files(../../../src/apps/{project}/*.h, true)\n")
        dummyproj.write(f"SOURCES += $$files(../../../src/shared/*.cpp, true)\n")
        dummyproj.write(f"SOURCES += $$files(../../../src/apps/{project}/*.cpp, true)\n")
        dummyproj.write(f"RESOURCES += $$files(../../../nebula/*.qrc, true)\n\n")
        dummyproj.write(f"RESOURCES += $$files(../../../src/apps/{project}/*.qrc, true)\n\n")
        dummyproj.write(f"RESOURCES += $$files(../../../src/shared/*.qrc, true)\n\n")

    # Step 8
    title("Generate translation resources...")
    for l10n_file in l10n_files:
        os.system(f"{lconvert} -if xlf -i {l10n_file['xliff']} -o {l10n_file['ts']}")

    os.system(f"{lupdate} {os.path.join('translations', 'generated', project, 'dummy_language.pro')}")
    for l10n_file in l10n_files:
        # Let's remove the non-translated strings if needed
        if l10n_file['locale'] != 'en':
            print(f"{lconvert} -i {l10n_file['ts']} -no-untranslated -o {l10n_file['ts']}")
            os.system(f"{lconvert} -i {l10n_file['ts']} -no-untranslated -o {l10n_file['ts']}")
        os.system(f"{lrelease} -idbased {l10n_file['ts']}")

    print(f'Imported {len(l10n_files)} locales')

    if os.path.isdir(i18ndir):
        git = os.popen(f'git submodule status f{i18ndir}')
        git_commit_hash = git.read().strip().replace("+","").split(' ')[0]
        print(f'Current commit:  https://github.com/mozilla-l10n/mozilla-vpn-client-l10n/commit/{git_commit_hash}')
