FROM python:3.10-slim

# 基本パッケージ
RUN apt-get update && apt-get install -y \
  build-essential \
  gdal-bin \
  libgdal-dev \
  python3-dev \
  curl \
  git \
  && rm -rf /var/lib/apt/lists/*

# pipアップグレード
RUN pip install --upgrade pip

# 作業ディレクトリ
WORKDIR /workspace
