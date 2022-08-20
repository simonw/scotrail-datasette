#!/bin/bash
sqlite-utils insert scotrail.db announcements announcements.csv --csv --pk File
sqlite-utils transform scotrail.db announcements --rename 'NRE ID' NRE_ID --rename 'mp3 file' 'mp3'
sqlite-utils scotrail.db "update announcements set mp3 = 'https://github.com/matteason/scotrail-announcements-june-2022/raw/main/announcements/' || mp3"

