#!/usr/bin/with-contenv sh
CFG=/config/configFile.cfg

# This copies the sample config in place if not one present
if [ ! -f $CFG ]; then
    echo "No config file, providing sample"
    cp /root/Packt-Publishing-Free-Learning/src/configFileTemplate.cfg $CFG
fi
# If environment arguments have been provided, switch the values in the sample config to these
if [ -n "$PACKT_EMAIL" ]; then
    echo "ENV PACKTEMAIL provided as '$PACKT_EMAIL'"
    sed -i s|email=.*|email=$PACKT_EMAIL| $CFG
else
    echo "ENV PACKTEMAIL not set"
fi

if [ -n "$PACKT_PASSWORD" ]; then
    echo "ENV PACKTPASSWORD provided as '$PACKT_PASSWORD'"
    sed -i s|password=.*|password=$PACKT_PASSWORD| $CFG
else
    echo "ENV PACKTEMAIL not set"
fi

if [ -n "$PACKT_DOWNLOAD_FORMATS" ]; then
    echo "ENV PACKT_DOWNLOAD_FORMATS provided as '$PACKT_DOWNLOAD_FORMATS'"
    sed -i s|download_formats:.*|download_formats: $PACKT_DOWNLOAD_FORMATS| $CFG
else
    echo "ENV PACKT_DOWNLOAD_FORMATS not set"
fi

if [ -n "$PACKT_DOWNLOAD_BOOK_TITLES" ]; then
    echo "ENV PACKT_DOWNLOAD_BOOK_TITLES provided as '$PACKT_DOWNLOAD_BOOK_TITLES'"
    sed -i s|download_book_titles:.*|download_book_titles: $PACKT_DOWNLOAD_BOOK_TITLES| $CFG
else
    echo "ENV PACKT_DOWNLOAD_BOOK_TITLES not set"
    sed -i s|download_book_titles:.*|download_book_titles:| $CFG
fi

if [ -n "$PACKT_ANTICAPTCHA_DATA" ]; then
    echo "ENV PACKT_ANTICAPTCHA_DATA provided as '$PACKT_ANTICAPTCHA_DATA'"
    sed -i s|key:.*|key: $PACKT_ANTICAPTCHA_DATA| $CFG
else
    echo "ENV PACKT_ANTICAPTCHA_DATA not set"
fi

echo "Replacing path with /data"
sed -i "s|downloadFolderPath:.*|downloadFolderPath: \/data|" $CFG
