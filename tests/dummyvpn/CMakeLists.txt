# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# For CMake versions prior to 3.19, we may need to perform manual
# finalization in order to pick up QML dependencies when built
# statically.
qt_add_executable(dummyvpn MANUAL_FINALIZATION)

target_link_libraries(dummyvpn PRIVATE
    Qt6::Quick
    Qt6::Test
    Qt6::WebSockets
    Qt6::Widgets
)

if(NOT ${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten" 
   AND NOT ${CMAKE_SYSTEM_NAME} STREQUAL "Android" )
    target_link_libraries(dummyvpn PRIVATE
        Qt6::NetworkAuth
    )
endif()

target_link_libraries(dummyvpn PRIVATE
    shared-sources
    mozillavpn-sources
    glean
    lottie
    nebula
    translations_vpn
    qtglean
)

target_sources(dummyvpn PRIVATE
    ${CMAKE_SOURCE_DIR}/src/apps/vpn/platforms/dummy/dummycontroller.cpp
    ${CMAKE_SOURCE_DIR}/src/apps/vpn/platforms/dummy/dummycontroller.h
)

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    find_package(Qt6 REQUIRED COMPONENTS DBus)
    target_link_libraries(dummyvpn PRIVATE Qt6::DBus)

    find_package(PkgConfig REQUIRED)
    pkg_check_modules(libsecret REQUIRED IMPORTED_TARGET libsecret-1)
    target_link_libraries(dummyvpn PRIVATE PkgConfig::libsecret)
endif()

target_compile_definitions(dummyvpn PRIVATE MZ_DEBUG)
target_compile_definitions(dummyvpn PRIVATE MZ_DUMMY)

qt6_add_qml_module(dummyvpn
  URI Mozilla.Shared.qmlcomponents
  VERSION 1.0
)

qt_finalize_target(dummyvpn)
