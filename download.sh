CURL="/usr/bin/curl"
XML_FILE_NAME="weekend_radio.xml"
DOWNLOAD_LIST="files_to_download.lst"
AXEL="/usr/bin/axel"
URL="http://r.saregama.com/resources/podcast/weekend_radio.xml"
echo "Starting download of Saragama Weekend classic songs"
$CURL $URL > $XML_FILE_NAME
cat  $XML_FILE_NAME | grep guid  | sed -e 's/.*<guid>\(.*\)<\/guid>.*/\1/'  > $DOWNLOAD_LIST
for file in `cat $DOWNLOAD_LIST`; do
    echo "Downloading : $file"
    $AXEL -qa $file 
done
echo "Download of current songs listed in Saregama Classic completed"
