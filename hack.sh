#!/usr/bin/env bash

DATE=2012-09-10
MAX_PER_DAY=10
while [ "$DATE" != $(date +"%Y-%m-%d") ]; do
      DATE=$(date -I -d "$DATE + 1 day")
      for h in $(seq -w 1 $((RANDOM%${MAX_PER_DAY}))); do
          CDATE="${DATE}T$((RANDOM%14+9)):$((RANDOM%59))"
          echo "GIT_AUTHOR_DATE='${CDATE}' GIT_COMMITTER_DATE='${CDATE}' git commit --allow-empty -m '${CDATE}'"
      done
done
