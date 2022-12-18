# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Group the core client sources together into an interface library.
# This allows us to pull them into multiple builds like the dummy client.
add_library(mozillavpn-sources INTERFACE)

# VPN client include paths
set_property(TARGET mozillavpn-sources PROPERTY INTERFACE_INCLUDE_DIRECTORIES
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/shared
    ${CMAKE_CURRENT_SOURCE_DIR}/shared/hacl-star
    ${CMAKE_CURRENT_SOURCE_DIR}/shared/hacl-star/kremlin
    ${CMAKE_CURRENT_SOURCE_DIR}/shared/hacl-star/kremlin/minimal
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer
    ${CMAKE_CURRENT_BINARY_DIR}
)

# VPN Client source files
target_sources(mozillavpn-sources INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addon.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addon.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addonapi.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addonapi.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addonguide.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addonguide.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addoni18n.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addoni18n.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addonmessage.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addonmessage.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addonproperty.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addonproperty.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addonpropertylist.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addonpropertylist.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addontutorial.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/addontutorial.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatcher.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatcher.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatcherfeaturesenabled.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatcherfeaturesenabled.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatchergroup.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatchergroup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatcherjavascript.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatcherjavascript.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatcherlocales.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatcherlocales.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatchertime.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatchertime.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatchertimeend.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatchertimestart.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatchertriggertimesecs.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/conditionwatchers/addonconditionwatchertriggertimesecs.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/manager/addondirectory.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/manager/addondirectory.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/manager/addonindex.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/manager/addonindex.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/manager/addonmanager.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/addons/manager/addonmanager.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/appimageprovider.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/applistprovider.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/apppermission.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/apppermission.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/authenticationinapp/authenticationinapp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/authenticationinapp/authenticationinapp.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/authenticationinapp/authenticationinapplistener.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/authenticationinapp/authenticationinapplistener.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/authenticationinapp/authenticationinappsession.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/authenticationinapp/authenticationinappsession.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/authenticationinapp/incrementaldecoder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/authenticationinapp/incrementaldecoder.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/authenticationlistener.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/authenticationlistener.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportal.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportaldetection.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportaldetection.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportaldetectionimpl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportaldetectionimpl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportalmonitor.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportalmonitor.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportalnotifier.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportalnotifier.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportalrequest.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportalrequest.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportalrequesttask.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/captiveportal/captiveportalrequesttask.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/collator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/collator.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/command.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/command.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commandlineparser.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commandlineparser.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandactivate.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandactivate.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commanddeactivate.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commanddeactivate.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commanddevice.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commanddevice.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandlogin.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandlogin.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandlogout.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandlogout.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandselect.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandselect.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandservers.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandservers.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandstatus.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandstatus.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandui.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/commands/commandui.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composer.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblock.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblock.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblockbutton.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblockbutton.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblockorderedlist.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblockorderedlist.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblocktext.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblocktext.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblocktitle.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblocktitle.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblockunorderedlist.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/composer/composerblockunorderedlist.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/benchmarktask.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/benchmarktask.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/benchmarktaskping.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/benchmarktaskping.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/benchmarktasksentinel.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/benchmarktasktransfer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/benchmarktasktransfer.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/connectionbenchmark.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/connectionbenchmark.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/uploaddatagenerator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionbenchmark/uploaddatagenerator.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionhealth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/connectionhealth.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/constants.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/constants.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/controller.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/controller.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/controllerimpl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/cryptosettings.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/cryptosettings.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/dnshelper.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/dnshelper.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/dnspingsender.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/dnspingsender.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/env.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/errorhandler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/errorhandler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/externalophandler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/externalophandler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/filterproxymodel.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/filterproxymodel.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/frontend/navigator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/frontend/navigator.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/frontend/navigatorreloader.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/frontend/navigatorreloader.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/glean/glean.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/glean/glean.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/glean/metrictypes.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/glean/generated/metrics.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/glean/generated/pings.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/glean/private/event.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/glean/private/event.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/glean/private/ping.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/glean/private/ping.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/imageproviderfactory.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/imageproviderfactory.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/inspector/inspectorhandler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/inspector/inspectorhandler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/inspector/inspectoritempicker.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/inspector/inspectoritempicker.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/inspector/inspectorutils.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/inspector/inspectorutils.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/inspector/inspectorwebsocketconnection.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/inspector/inspectorwebsocketconnection.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/inspector/inspectorwebsocketserver.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/inspector/inspectorwebsocketserver.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/ipaddresslookup.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/ipaddresslookup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/itempicker.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/itempicker.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/keyregenerator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/keyregenerator.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/localizer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/localizer.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/logoutobserver.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/logoutobserver.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/device.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/device.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/devicemodel.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/devicemodel.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/feature.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/feature.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/featuremodel.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/featuremodel.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/feedbackcategorymodel.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/feedbackcategorymodel.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/keys.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/keys.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/licensemodel.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/licensemodel.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/recentconnections.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/recentconnections.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/server.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/server.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/servercity.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/servercity.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/servercountry.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/servercountry.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/servercountrymodel.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/servercountrymodel.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/serverdata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/serverdata.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/subscriptiondata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/subscriptiondata.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/supportcategorymodel.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/supportcategorymodel.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/user.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/models/user.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/mozillavpn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/mozillavpn.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/networkmanager.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/networkmanager.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/networkrequest.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/networkrequest.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/networkwatcher.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/networkwatcher.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/networkwatcherimpl.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/notificationhandler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/notificationhandler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/pinghelper.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/pinghelper.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/pingsender.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/pingsender.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/pingsenderfactory.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/pingsenderfactory.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/platforms/dummy/dummyapplistprovider.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/platforms/dummy/dummyapplistprovider.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/platforms/dummy/dummynetworkwatcher.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/platforms/dummy/dummynetworkwatcher.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/platforms/dummy/dummypingsender.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/platforms/dummy/dummypingsender.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/productshandler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/productshandler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/profileflow.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/profileflow.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/purchasehandler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/purchasehandler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/purchaseiaphandler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/purchaseiaphandler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/purchasewebhandler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/purchasewebhandler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/qmlengineholder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/qmlengineholder.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/releasemonitor.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/releasemonitor.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/serveri18n.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/serveri18n.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/serverlatency.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/serverlatency.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/settingsholder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/settingsholder.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/signature.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/signature.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/simplenetworkmanager.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/simplenetworkmanager.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/statusicon.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/statusicon.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/account/taskaccount.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/account/taskaccount.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/adddevice/taskadddevice.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/adddevice/taskadddevice.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/addon/taskaddon.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/addon/taskaddon.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/addonindex/taskaddonindex.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/addonindex/taskaddonindex.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/authenticate/taskauthenticate.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/authenticate/taskauthenticate.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/captiveportallookup/taskcaptiveportallookup.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/captiveportallookup/taskcaptiveportallookup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/controlleraction/taskcontrolleraction.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/controlleraction/taskcontrolleraction.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/createsupportticket/taskcreatesupportticket.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/createsupportticket/taskcreatesupportticket.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/deleteaccount/taskdeleteaccount.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/deleteaccount/taskdeleteaccount.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/function/taskfunction.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/function/taskfunction.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/getfeaturelist/taskgetfeaturelist.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/getfeaturelist/taskgetfeaturelist.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/getsubscriptiondetails/taskgetsubscriptiondetails.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/getsubscriptiondetails/taskgetsubscriptiondetails.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/group/taskgroup.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/group/taskgroup.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/heartbeat/taskheartbeat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/heartbeat/taskheartbeat.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/ipfinder/taskipfinder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/ipfinder/taskipfinder.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/products/taskproducts.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/products/taskproducts.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/release/taskrelease.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/release/taskrelease.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/removedevice/taskremovedevice.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/removedevice/taskremovedevice.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/sendfeedback/tasksendfeedback.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/sendfeedback/tasksendfeedback.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/servers/taskservers.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/servers/taskservers.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/telemetry.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/telemetry.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/theme.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/theme.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tutorial/tutorial.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tutorial/tutorial.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tutorial/tutorialstep.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tutorial/tutorialstep.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tutorial/tutorialstepbefore.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tutorial/tutorialstepbefore.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tutorial/tutorialstepnext.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tutorial/tutorialstepnext.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/update/updater.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/update/updater.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/update/versionapi.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/update/versionapi.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/update/webupdater.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/update/webupdater.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/urlopener.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/urlopener.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/websocket/exponentialbackoffstrategy.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/websocket/exponentialbackoffstrategy.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/websocket/pushmessage.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/websocket/pushmessage.h
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/websocket/websockethandler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/websocket/websockethandler.h
)

# VPN Client UI resources
target_sources(mozillavpn-sources INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/ui/license.qrc
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/ui/resources.qrc
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/ui/ui.qrc
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/resources/certs/certs.qrc
    ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/resources/public_keys/public_keys.qrc
)

# Signal handling for unix platforms
if(UNIX)
     target_sources(mozillavpn-sources INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/signalhandler.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/signalhandler.h
     )
endif()

# Sources for desktop platforms.
if(NOT CMAKE_CROSSCOMPILING)
     target_sources(mozillavpn-sources INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/systemtraynotificationhandler.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/systemtraynotificationhandler.h
        ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/authenticate/desktopauthenticationlistener.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/tasks/authenticate/desktopauthenticationlistener.h
        ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/server/serverconnection.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/server/serverconnection.h
        ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/server/serverhandler.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/apps/vpn/server/serverhandler.h
       )
endif()
