#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "사용법: ./practice11.sh <파일경로>"
    exit 1
fi

filepath="$1"

if [ ! -f "$filepath" ]; then
    echo "파일이 존재하지 않습니다: $filepath"
    exit 2
fi

echo "파일 확인 완료: $filepath"

cat "$filepath" > /dev/null
if [ "$?" -ne 0 ]; then
    echo "파일을 읽을 수 없습니다."
    exit 3
fi

echo "정상 종료"