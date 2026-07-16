#!/bin/bash
running_count=0
stopped_count=0
other_count=0

check_status() {
    local name="$1"
    local status="$2"

    if [ "$status" == "running" ]; then
        echo "[$name] 정상 작동 중"
        running_count=$((running_count+1))
    elif [ "$status" == "stopped" ]; then
        echo "[$name] 중지됨"
        stopped_count=$((stopped_count+1))
    else
        echo "[$name] 알 수 없는 상태"
        other_count=$((other_count+1))
    fi
}

if [ "$#" -ne 2 ]; then
    echo "사용법: ./practice8.sh <서버이름> <상태>"
    exit 1
fi

check_status "$1" "$2"