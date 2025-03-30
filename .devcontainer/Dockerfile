FROM python:3.10-slim

# 基本パッケージのインストール
RUN apt-get update && apt-get install -y \
  build-essential \
  gdal-bin \
  libgdal-dev \
  python3-dev \
  curl \
  git \
  vim \
  nginx \
  python3-pip \
  python3-venv \
  && rm -rf /var/lib/apt/lists/*

# pipのアップグレード
RUN pip install --upgrade pip

# requirements.txt のインストール
COPY requirements.txt /workspace/requirements.txt
RUN pip install -r /workspace/requirements.txt

# 作業ディレクトリ
WORKDIR /workspace
