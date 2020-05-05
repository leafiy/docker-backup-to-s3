#!/bin/bash

set -e
date=$(date +"%Y%m%d")
echo "Job started: $(date) backup $DATA_PATH"
tar -czvf $DATA_PATHbackup_$date.tar.gz "$DATA_PATH"
/usr/local/bin/s3cmd sync $PARAMS $DATA_PATHbackup_$date.tar.gz "$S3_PATH"
rm $DATA_PATHbackup_$date.tar.gz
echo "Job finished: $(date)"
