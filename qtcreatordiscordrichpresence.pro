DEFINES += QTCREATORDISCORDRICHPRESENCE_LIBRARY

# QtCreatorDiscordRichPresence files

SOURCES += qtcreatordiscordrichpresenceplugin.cpp

HEADERS += qtcreatordiscordrichpresenceplugin.h \
        qtcreatordiscordrichpresence_global.h \
        qtcreatordiscordrichpresenceconstants.h

LIBS += -ldiscord-rpc

# Qt Creator linking

## Either set the IDE_SOURCE_TREE when running qmake,
## or set the QTC_SOURCE environment variable, to override the default setting
isEmpty(IDE_SOURCE_TREE): IDE_SOURCE_TREE = $$(QTC_SOURCE)

## Either set the IDE_BUILD_TREE when running qmake,
## or set the QTC_BUILD environment variable, to override the default setting
isEmpty(IDE_BUILD_TREE): IDE_BUILD_TREE = $$(QTC_BUILD)

exists(qtcreator.local.pri) {
    include(qtcreator.local.pri)
}

## uncomment to build plugin into user config directory
## <localappdata>/plugins/<ideversion>
##    where <localappdata> is e.g.
##    "%LOCALAPPDATA%\QtProject\qtcreator" on Windows Vista and later
##    "$XDG_DATA_HOME/data/QtProject/qtcreator" or "~/.local/share/data/QtProject/qtcreator" on Linux
##    "~/Library/Application Support/QtProject/Qt Creator" on OS X
USE_USER_DESTDIR = yes

###### If the plugin can be depended upon by other plugins, this code needs to be outsourced to
###### <dirname>_dependencies.pri, where <dirname> is the name of the directory containing the
###### plugin's sources.

QTC_PLUGIN_NAME = QtCreatorDiscordRichPresence
QTC_LIB_DEPENDS += \
    # nothing here at this time

QTC_PLUGIN_DEPENDS += \
    coreplugin \
    projectexplorer

QTC_PLUGIN_RECOMMENDS += \
    # optional plugin dependencies. nothing here at this time

###### End _dependencies.pri contents ######

include($$IDE_SOURCE_TREE/src/qtcreatorplugin.pri)

## discord RPC
exists(discord-rpc.local.pri) {
    include(discord-rpc.local.pri)
}


## broken libs
exists(broken-libs.local.pri) {
    include(broken-libs.local.pri)
}

DISTFILES += \
    .gitignore \
    broken-libs.local.pri \
    broken-libs.local.pri.example \
    discord-rpc.local.pri \
    discord-rpc.local.pri.example \
    qtcreator.local.pri \
    qtcreator.local.pri.example
