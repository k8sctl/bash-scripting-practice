#!/bin/bash
running_count=0
stopped_count=0
other_count=0

servers=("web01" "web02" "db01" "cache01")
statuses=("running" "stopped" "running" "paused")

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

echo "총 ${#servers[@]}대 서버 점검 시작"

for i in "${!servers[@]}"; do
    check_status "${servers[$i]}" "${statuses[$i]}"
done

echo "총 $((running_count+stopped_count+other_count))대 점검 완료 - 정상: $running_count, 중지: $stopped_count, 알수없음: $other_count"