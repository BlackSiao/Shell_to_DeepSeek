# 直接用shell吧
厌烦了每次问大语言模型都要打开Web，还要等网页渲染？直接走API吧，省心多了

# 这个Shell脚本运行在Linux系统
不知道为什么，使用git bash运行的时候无法处理中文字符，报错也没整明白，换到Linux系统上后马上就能跑了，而且还特别流畅

# 你所需要的：
 - sudo apt install jq
 - 去官网申请一个API-key，并添加到环境变量中打开
 - 直接运行脚本就好了

![运行效果](https://github.com/BlackSiao/Shell_to_DeepSeek/blob/main/%E8%BF%90%E8%A1%8C%E7%BB%93%E6%9E%9C.png)

# 待更新的内容
deepseek官网的API文档写的就是一坨，太简陋了。这个脚本还没能实现打字机效果，等过几天我再看看怎么处理

## 2025-3-17 已实现打字机效果，deepSeek使用 SSE（server-sent events）来实现打字机效果，消息流以 data: [DONE] 结尾。

## 但是DeepSeek的API响应速度还是有点慢
