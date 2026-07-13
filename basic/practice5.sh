#!/bin/bash
count=5
while [ "$count" -ge 0 ]; do
    if [ "$count" == 0 ]; then
        echo "발사!"
        break
    else
        echo "남은 시간: $count 초"
        count=$((count-1))
    fi
done