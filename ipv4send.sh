#!/bin/bash

# 使用国内 API 获取当前公网 IPv4 地址
ipv4=$(curl -s http://ip.3322.net)

# Server酱 API Key (替换为你的实际API Key)
sckey=""

# 检查是否成功获取 IPv4 地址
if [ -z "$ipv4" ]; then
  echo "Failed to retrieve IPv4 address."
  exit 1
fi

# 发送推送请求到 Server酱
title="当前 IPv4 地址推送"
content="您的当前公网 IPv4 地址为：$ipv4"

curl -s -X POST "https://1065.push.ft07.com/send/$sckey.send" \
  -d "title=$title&desp=$content"

# 输出推送结果
if [ $? -eq 0 ]; then
  echo "IPv4 地址推送成功：$ipv4"
else
  echo "推送失败。"
fi