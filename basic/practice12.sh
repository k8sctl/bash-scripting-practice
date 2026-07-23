#!/bin/bash
# practice12.sh - 로그 파일 분석기

count_level() {
    local logfile="$1"
    local level="$2"
    grep -ci "$level" "$logfile"
}

if [ "$#" -ne 1 ]; then
    echo "사용법: ./practice12.sh <로그파일경로>"
    exit 1
fi

logfile="$1"

if [ ! -f "$logfile" ]; then
    echo "파일이 존재하지 않습니다: $logfile"
    exit 2
fi

levels=("ERROR" "WARN" "INFO")

echo "===== 로그 분석: $logfile ====="
echo "총 라인 수: $(wc -l < "$logfile")"
echo ""

for level in "${levels[@]}"; do
    count=$(count_level "$logfile" "$level")
    echo "$level: ${count}건"
done

error_count=$(count_level "$logfile" "ERROR")

echo ""
if [ "$error_count" -gt 0 ]; then
    echo "===== 최근 ERROR 로그 (최대 3건) ====="
    grep -i "ERROR" "$logfile" | tail -3
else
    echo "ERROR 로그가 없습니다."
fi