#!/bin/bash
# uploadPhotos.sh - Upload automounted directory of photos
# onto dropbox.
# Bob Sullivan
# BobSullivan63@gmail.com
# License: MIT as below.
# http://opensource.org/licenses/MIT
# 2/16/15
#
# Uses dropbox uploader from:
# https://github.com/andreafabrizi/Dropbox-Uploader
#
#
# PICTURE_DIR - where pictures automount to
#
#export PICTURE_DIR=~/Scripts
export PICTURE_DIR=/music/USB/DCIM/100OLYMP
#
# PICTURE_EXT - picture file extension
#
#export PICTURE_EXT=png
export PICTURE_EXT=JPG

#
# Test if directory exists
#
if [ -d "${PICTURE_DIR}" ]
then
    echo Picture directory exists ${PICTURE_DIR}

    # for all pictures in the directory
    for pfile in ${PICTURE_DIR}/*.${PICTURE_EXT}; do
        # get file basics for use in upload
        echo file is ${pfile}
        BASE_PIC=`basename ${pfile}`
        echo base file is ${BASE_PIC}
        DATE_DIR=`date +"%m-%d-%y"`
        echo date dir is ${DATE_DIR}
        # create scripts arguments for dropbox upload
        echo ~/bin/dropbox_uploader.sh upload ${pfile} ${DATE_DIR}/${BASE_PIC}
        # dropbox upload via dropbox_uploader.sh
        ~/bin/dropbox_uploader.sh upload ${pfile} ${DATE_DIR}/${BASE_PIC}
    done
else
  echo Picture directory does not exist ${PICTURE_DIR}
fi
