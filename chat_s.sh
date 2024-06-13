#!/bin/bash

# 检查是否提供了参数
if [ $# -lt 1 ]; then
  echo "Usage: $0 '<user_content>'"
  exit 1
fi

# 获取传递的第一个参数作为用户内容
USER_CONTENT=$1

# 使用 curl 发送请求
curl -X POST "http://192.168.0.103:3000/v1/chat/completions" \
-H "Content-Type: application/json" \
-d '{
  "model": "ensemble",
  "messages": [
    {
      "role": "system",
      "content": "你是ChatGLM3，由智谱.AI训练的大型语言模型。请仔细按照用户的指示进行操作。使用Markdown格式进行回应。"
    },
    {
      "role": "user",
      "content": "'"${USER_CONTENT}"'"
    }
  ],
  "stream": true,
  "max_tokens": 1024,
  "temperature": 0.9,
  "top_p": 0.8
}'
