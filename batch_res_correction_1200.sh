#!/bin/bash

#envel.kerdaffrec$ sh /Users/envel.kerdaffrec/GMI/projects/seed_size/batch_res_correction_1200.sh /Volumes/nordborg/user/envel.kerdaffrec/Documents/seed_size/swedes_lab


# Usage of the script: ./tiffset-script /path/to/your/image/directory
# Note: /path/to/your/image/directory should specify the directory only. If you want to process certain images, change the "filepattern" accordingly

# change the path to your tiffset command
path="~/Work/GMI/projects/prog/tiff-4.3.0/tools/tiffset"

# change resolution to your needs
resolution="1200"

# change the file pattern if you want to specify certain images
filepattern="*.tif"

# here the magic is done
# do not change anything below this line
for file in $( find $1 -maxdepth 1 -type f \( -name $filepattern ! -name ".*" \) ); do
   echo "changing resolution of image: $file"
   eval "$path -s 282 $resolution $file"
   eval "$path -s 283 $resolution $file"
done