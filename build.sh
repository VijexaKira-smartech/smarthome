echo "Building..."
node build/builder.js src/index.html Core/page.html

if [[ $1 == "upload" ]]; then
    echo "Formatting..."
    node node_modules/nodemcu-tool/bin/nodemcu-tool.js -p %1 -b 115200 mkfs

    echo "Uploading..."
    node node_modules/nodemcu-tool/bin/nodemcu-tool.js -p %1 -b 115200 upload Core/*
    node node_modules/nodemcu-tool/bin/nodemcu-tool.js -p %1 -b 115200 fsinfo
    node node_modules/nodemcu-tool/bin/nodemcu-tool.js -p %1 -b 115200 reset

    echo "ESP8266 is ready!"
fi