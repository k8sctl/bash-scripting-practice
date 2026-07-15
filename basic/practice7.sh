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

read -p "점검할 서버 개수: " count
for (( i=1; i<=count; i++ )); do
    read -p "서버의 이름: " name
    read -p "서버의 상태(running/stopped): " status

    check_status "$name" "$status"
done
echo "총 $((running_count+stopped_count+other_count)) - 정상: $running_count, 중지: $stopped_count, 알수없음: $other_count"