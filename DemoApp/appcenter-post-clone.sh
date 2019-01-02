#!/usr/bin/env bash
echo "Executing post clone script in `pwd`"
echo $NPM_RC | base64 --decode > $APPCENTER_SOURCE_DIRECTORY/DemoApp/.npmrc
# Delete everything except DemoApp folder
rm -rf ../appcenter* ../AppCenterReactNativeShared ../TestApp34 ../BrownfieldTestApp ../TestApp

brew uninstall node@6

# Please specify required Node.js version
NODE_VERSION="8.12.0"
curl "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.pkg" > "$HOME/Downloads/node-installer.pkg"
sudo installer -store -pkg "$HOME/Downloads/node-installer.pkg" -target "/"

echo "//registry.npmjs.org/:_authToken=${NPM_AUTH_TOKEN}" > ~/.npmrc

# Workaround to override the v8 alias
npm config delete prefix
. ~/.bashrc
nvm install "$NODE_VERSION"
nvm alias node8 "$NODE_VERSION"
