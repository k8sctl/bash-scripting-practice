read -p "서버 이름을 입력하세요: " server
read -p "서버 상태를 입력하세요(running/stopped): " status
echo "server: [$server] / status: [$status]"

if [ "$status" == "running" ]; then
    echo "정상 작동 중입니다."
elif [ "$status" == "stopped" ]; then
    echo "서버가 중지되어 있습니다."
else
    echo "점검이 필요합니다."
fi