#!/bin/sh

CFG=/config/configFile.cfg

# This copies the sample config if one is not present in the config dir
if [ ! -f $CFG ]; then
	echo 'No config file, providing sample'
	cp /root/Packt-Publishing-Free-Learning/src/configFileTemplate.cfg $CFG
fi
# If environment arguments have been provided, switch the values in the sample config to these
if [ -n "$PACKT_EMAIL" ]; then
	echo 'ENV PACKT_EMAIL provided'
	sed -i s/email=.*/email="$PACKT_EMAIL"/ $CFG
else
	echo 'ENV PACKTEMAIL not set'
fi

if [ -n "$PACKT_PASSWORD" ]; then
	echo 'ENV PACKT_PASSWORD provided'
	sed -i s/password=.*/password="$PACKT_PASSWORD"/ $CFG
else
	echo 'ENV PACKTEMAIL not set'
fi

if [ -n "$PACKT_DOWNLOAD_FORMATS" ]; then
	echo "ENV PACKT_DOWNLOAD_FORMATS provided as '$PACKT_DOWNLOAD_FORMATS'"
	sed -i s/download_formats:.*/download_formats:\ "$PACKT_DOWNLOAD_FORMATS"/ $CFG
else
	echo 'ENV PACKT_DOWNLOAD_FORMATS not set'
fi

if [ -n "$PACKT_DOWNLOAD_BOOK_TITLES" ]; then
	echo "ENV PACKT_DOWNLOAD_BOOK_TITLES provided as '$PACKT_DOWNLOAD_BOOK_TITLES'"
	sed -i s/download_book_titles:.*/download_book_titles:\ "$PACKT_DOWNLOAD_BOOK_TITLES"/ $CFG
else
	echo 'ENV PACKT_DOWNLOAD_BOOK_TITLES not set'
	sed -i s/download_book_titles:.*/download_book_titles:/ $CFG
fi

if [ -n "$PACKT_ANTICAPTCHA_KEY" ]; then
	echo 'ENV PACKT_ANTICAPTCHA_Key provided'
	sed -i s/key:.*/key:\ "$PACKT_ANTICAPTCHA_KEY"/ $CFG
else
	echo 'ENV PACKT_ANTICAPTCHA_KEY not set'
fi

echo 'Replacing path with /data'
sed -i s@download_folder_path:.*@download_folder_path:\ \\/data@ $CFG

echo 'Set logfile path to /data'
sed -i s@ebook_extra_info_log_file_path:.*@ebook_extra_info_log_file_path:\ \\/data\\/eBookMetadata.log@ $CFG

echo 'Start crond'
crond -f
