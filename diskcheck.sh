#!/bin/bash
# diskcheck.sh - 디스크 사용량 모니터링 스크립트

THRESHOLD=80
alert_found=0

while read -r filesystem usage; do
  usage_num=${usage%\%}

  if [ "$usage_num" -gt "$THRESHOLD" ]; then
    echo "경고: $filesystem 은 ${usage_num}% 사용 중입니다."
    alert_found=1
  fi
done < <(df -h | awk 'NR>1 {print $1, $5}')

if [ "$alert_found" -eq 0 ]; then
  echo "모든 파티션 정상입니다."
fi