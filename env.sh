#!/bin/bash

echo "[INFO] Updating package list..."
pkg update

# ENVIRONMENT SETUP
echo "[INFO] Installing required packages..."
pkg install -y curl
pkg install -y python
pkg install -y rust
pkg install -y build-essential
pkg install -y binutils
               
# PYTHON SETUP
echo "[INFO] Installing Python libraries..."
pip install openai

# SCRIPT SETUP
echo "[INFO] Cloning the GitHub repository..."
git clone https://github.com/gitctrlx/script.git

echo "[INFO] Entering the repository directory..."
cd script

echo "[INFO] Environment setup complete."

# DEMO
echo "[INFO] Run a stream chat demo."
echo "[INFO] Usage: chat_s.sh '<user_content>'"
echo "[INFO] Example: chat_s.sh '你好，你是什么大模型？'"
echo "------------------------------"
python chat_s.py "你好，你是什么大模型？"

echo "[INFO] Example: chat_s.sh '请你写一个CUDA代码, 实现矩阵乘法。'"
echo "------------------------------"
python chat_s.py "请你写一个CUDA代码, 实现矩阵乘法。"