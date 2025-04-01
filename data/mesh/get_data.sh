#!/bin/bash

# ダウンロード先ディレクトリの作成
mkdir -p e-stat_data
cd e-stat_data

# 都道府県コードのリスト
for code in $(seq -w 1 47)
do
  echo "Downloading data for prefecture code: $code"
  wget "https://www.e-stat.go.jp/gis/statmap-search/data?dlserveyId=D002005112020&code=${code}&coordSys=1&format=shape&downloadType=5&datum=2011" -O "prefecture_${code}.zip"
done

echo "All downloads completed."

