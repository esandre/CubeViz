rm -Rf lib
mkdir lib
mkdir lib/client
cp -fi src/client/* lib/client/
node_modules/coffee-script/bin/coffee --compile --output lib/ src/
node lib/server.js