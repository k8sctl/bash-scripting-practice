#!/bin/bash
name="$1"

echo "이름 길이: ${#name}"
echo "소문자 변환: ${name,,}"
echo "변환 결과: ${name/Server/Node}"