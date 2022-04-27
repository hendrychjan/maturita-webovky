#! /bin/bash
WORKING_DIR=$( pwd )
mkdir /opt/lampp/htdocs/maturita-webovky
rsync -avch $WORKING_DIR /opt/lampp/htdocs/