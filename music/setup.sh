SC_EXTENSIONS_DIR="$HOME/Library/Application Support/SuperCollider/Extensions"

SC3PLUGINS_URL="https://github.com/supercollider/sc3-plugins/releases/download/Version-3.11.1/sc3-plugins-3.11.1-macOS-signed.zip"
VSTPLUGIN_URL="https://git.iem.at/pd/vstplugin/uploads/07f804958d1d23ec4c6daab3df5aba88/VSTPlugin_v0.5.4_Darwin.zip"

brew bundle --file Brewfile

# install SC3plugins
wget $SC3PLUGINS_URL
unzip $(basename -- $SC3PLUGINS_URL)
rsync -av --delete "SC3plugins" "$SC_EXTENSIONS_DIR"
rm $(basename -- $SC3PLUGINS_URL)
rm -rf "SC3plugins"

# install VSTPLUGIN
wget $VSTPLUGIN_URL
unzip $(basename -- $VSTPLUGIN_URL)
rsync -av --delete "VSTPlugin" "$SC_EXTENSIONS_DIR"
rm $(basename -- $VSTPLUGIN_URL)
rm -rf "VSTPlugin"

# install Quarks
sclang "install_quarks.scd"
