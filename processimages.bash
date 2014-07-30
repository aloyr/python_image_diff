#!/bin/bash
if [ $# -ne 3 ]; then
  echo "Usage: $0 <image 1> <image 2> <output image>"
  exit
fi

mkdir -p deliverables &> /dev/null

function getImageName() {
  if [ ${1:0:1} != '~' ] && [ ${1:0:1} != '/' ]; then
    echo "//$1"
  else
    echo "$1"
  fi
}

img1=$(getImageName $1)
img2=$(getImageName $2)
/Applications/blender.app/Contents/MacOS/blender -b image_diff.blend -o //output --python-text imagediff -f 1 -F PNG -- $img1 $img2 1> /dev/null 
mv output0001.png deliverables/$3
open deliverables/$3
