#!/bin/sh

INSTALL_FILES=".bash_aliases .bashrc .tmux.conf .vimrc"
ARCHIVE_FILES=""
DATE=$(date +%Y%m%m-%H%M)
ARCHIVE_NAME=dot-files-${DATE}.tar.bz2

echo "Making an archive of original files ..."
for FILE in $INSTALL_FILES;
do
  [ -f ${FILE} ] && ARCHIVE_FILES="$ARCHIVE_FILES $FILE"
done
tar cjf ${ARCHIVE_NAME} ${ARCHIVE_FILES}

echo "Installing files ..."
for FILE in $INSTALL_FILES;
do
  cp $FILE ~
done
