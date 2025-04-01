#!/bin/bash

# 結合対象のディレクトリ群
DIRS=("HDDSWH5238" "HDDSWH5239" "HDDSWH5338" "HDDSWH5339")

# 出力先
MERGE_DIR="merge"
mkdir -p "${MERGE_DIR}"

# 一時ファイルに全ファイル名（重複含む）を収集
ALL_FILES=$(mktemp)

# 各ディレクトリの中のファイル名を収集
for dir in "${DIRS[@]}"; do
    find "$dir" -type f -printf "%f\n" >> "$ALL_FILES"
done

# 重複を除いてユニークなファイル名リストを取得
sort "$ALL_FILES" | uniq | while read FILENAME; do
    echo "🔄 マージ中: $FILENAME"
    # 同名ファイルを全ディレクトリから探して cat で結合
    for dir in "${DIRS[@]}"; do
        if [ -f "${dir}/${FILENAME}" ]; then
            cat "${dir}/${FILENAME}" >> "${MERGE_DIR}/${FILENAME}"
        fi
    done
done

# 一時ファイル削除
rm "$ALL_FILES"

echo "✅ マージ完了: ${MERGE_DIR}/ に出力しました。"

