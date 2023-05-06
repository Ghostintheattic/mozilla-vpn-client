#!/bin/bash
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set -e

# Reqs
git submodule update --init --depth 1

for i in src/apps/*/translations/i18n; do
  git submodule update --remote $i
done

pip3 install -r requirements.txt

mkdir build-addons
cmake -S $(pwd)/addons -B build-addons -GNinja
cmake --build build-addons

cp -r build-addons/generated/ $TASK_WORKDIR/addons
zip -r /builds/worker/artifacts/addons.zip $TASK_WORKDIR/addons 
cp build-addons/generated/*.rcc $TASK_WORKDIR/artifacts
cp build-addons/generated/manifest.json $TASK_WORKDIR/artifacts
