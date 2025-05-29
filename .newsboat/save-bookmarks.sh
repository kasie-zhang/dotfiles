#!/bin/bash
echo -e "Title: $2\n" >> ~/.newsboat/bookmarks.txt
echo -e "URL:   $1\n" >> ~/.newsboat/bookmarks.txt
echo "From:  $4" >> ~/.newsboat/bookmarks.txt
echo "------------------------------------------------------------" >> ~/.newsboat/bookmarks.txt
