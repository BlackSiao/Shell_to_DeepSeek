#!/bin/bash

# DeepSeek API 密钥
# 推荐使用环境变量
DeepSeek_API="写上你的API-KEY"

# 无限循环，直到用户输入“退出”
while true; do
  # 等待用户输入问题
  echo "请输入您的问题（输入 'exit' 结束对话）:"
  read user_input

  # 如果用户输入 "exit"，则结束循环
  if [ "$user_input" == "exit" ]; then
    echo "结束对话，谢谢！"
    break
  fi

# 发送请求并仅提取答案
response=$(curl -s https://api.deepseek.com/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DeepSeek_API" \
  -d '{
        "model": "deepseek-chat",
        "messages": [
          {"role": "system", "content": "You are a helpful assistant."},
          {"role": "user", "content": "'"$user_input"'"}
        ],
        "stream": false
      }')

# 提取并显示答案
  answer=$(echo "$response" | jq -r '.choices[0].message.content')

  # 输出答案
  echo "Answer: $answer"
done