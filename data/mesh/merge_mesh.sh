#!/bin/bash

# 統合対象ディレクトリ
TARGET_DIR="神奈川"
OUTPUT_FILE="merged_mesh.shp"

# カレントディレクトリを対象ディレクトリに移動
cd "$TARGET_DIR" || exit 1

# すべての .shp ファイルを取得
shp_files=($(find . -name "*.shp" | sort))

# 最初のファイルでベースを作成
first_shp=${shp_files[0]}
ogr2ogr "$OUTPUT_FILE" "$first_shp"

# 残りのファイルを追加
for shp in "${shp_files[@]:1}"; do
  ogr2ogr -update -append "$OUTPUT_FILE" "$shp" -nln merged_mesh
done

echo "✅ マージ完了：$TARGET_DIR/$OUTPUT_FILE"

