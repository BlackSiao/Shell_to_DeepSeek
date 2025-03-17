#!/bin/bash

# DeepSeek API 密钥
DeepSeek_API="输入你的API—Key"

# 无限循环，直到用户输入“exit”
while true; do
  # 等待用户输入问题
  echo "请输入您的问题（输入 'exit' 结束对话）："
  read user_input

  # 如果用户输入 "exit"，则结束循环
  if [ "$user_input" == "exit" ]; then
    echo "结束对话，谢谢！"
    break
  fi

  # 发送请求并处理流式响应
  curl -s https://api.deepseek.com/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $DeepSeek_API" \
    -d '{
          "model": "deepseek-chat",
          "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "'"$user_input"'"}
          ],
          "stream": true
        }' | while IFS= read -r line; do
          # 检查是否为数据行
          if [[ "$line" == data:* ]]; then
            # 去掉前缀 "data: "
            content="${line#data: }"
            # 检查是否为流结束标志
            if [[ "$content" == "[DONE]" ]]; then
              break
            fi
            # 解析 JSON 并提取消息内容
            message=$(echo "$content" | jq -r '.choices[0].delta.content // empty')
            # 输出消息内容
            echo -n "$message"
          fi
        done
  # 输出换行符
  echo
done
