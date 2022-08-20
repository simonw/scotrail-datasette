#!/bin/bash
sqlite-utils insert scotrail.db announcements announcements.csv --csv --pk File
sqlite-utils transform scotrail.db announcements \
  --rename 'NRE ID' NRE_ID \
  --rename 'mp3 file' 'mp3' \
  -o File \
  -o Transcription \
  -o Category \
  -o mp3 \
  -o Notes \
  -o Timestamp \
  -o NRE_ID
sqlite-utils scotrail.db "update announcements set mp3 = 'https://github.com/matteason/scotrail-announcements-june-2022/raw/main/announcements/' || mp3"

# Enable search
sqlite-utils enable-fts scotrail.db announcements Transcription --tokenize porter
