#!/bin/bash
fuser -k 3000/tcp
fuser -k 5000/tcp

service redis start
cd ./oj-server
npm i
npm run dev &
cd ../oj-client
npm i
npm start &
cd ../executor
pip install -r requirements.txt
python3 executor_server.py &

echo "=================================================="
read -p "Pressione [ENTER] para fechar os processos." PRESSKEY

fuser -k 3000/tcp
fuser -k 5000/tcp
service redis stop
