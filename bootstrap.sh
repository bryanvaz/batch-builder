#!/bin/bash

echo "Downloading Source Bundle"

if [ -z "$SOURCE_BUNDLE" ]
then
      echo "\$SOURCE_BUNDLE is empty. Please set \$SOURCE_BUNDLE to execute builder"
      exit 1;
fi

curl ${SOURCE_BUNDLE} --output output.zip
unzip output.zip -d /app

/bin/bash /app/${ENTRYPOINT}

exit;