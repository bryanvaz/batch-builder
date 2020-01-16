#!/bin/bash

echo "*** Downloading Source Bundle ***"

if [ -z "$SOURCE_BUNDLE" ]
then
      echo "\$SOURCE_BUNDLE is empty. Please set \$SOURCE_BUNDLE to executcurl e builder"
      exit 1;
fi

curl ${SOURCE_BUNDLE} --output output.zip
unzip output.zip -d /app

echo "*** App directory '/app' has the following contents ***"
ls -alh /app

echo "*** Changing directory to '/app' ***"
cd /app

echo "*** Running '${ENTRYPOINT}' ***"
/bin/bash ${ENTRYPOINT}

exit;