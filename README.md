# GISモックアプリ

公開されている地理情報 (GIS) データを元に、QGISでビジュアライズしたWebマップを表示するFlaskアプリです。

## デモ画像

以下はTerraformを用いたAWSでのインフラ構成を表したダイアグラムです。

![Image](https://github.com/user-attachments/assets/59e71686-28d9-4037-8129-386114f9c410)

## Requirement

Pythonパッケージリストは次のとおりです (一部抽出):

- Flask 3.1.0
- geopandas 1.0.1
- folium 0.19.5
- pyproj 3.7.1
- shapely 2.0.7
- matplotlib 3.10.1
- pandas 2.2.3

すべての依存パッケージは `requirements.txt` に記述されています。

## Installation

### 1. ローカルランチ

```bash
git clone git@github.com:takeru403/map_mocup.git
cd app
python app.py
```

以下のURLでローカル端末で動作を確認できます:

```
http://127.0.0.1:5000
```

### 2. Docker + Devcontainer 環境

```bash
cd .devcontainer
docker compose up
```

### 3. EC2へのデプロイ

GitHub Actions と Terraform を用いて自動デプロイが可能です

#### 直接EC2でプルして再起動:

```bash
ssh -i ~/.ssh/my-key.pem ec2-user@xx.xx.xx.xx
cd /home/ec2-user/app
git pull origin takeru
sudo systemctl restart gunicorn
```

## 構成

- `app/` : Flask本体
- `static/` : QGISから出力したWebMap
- `templates/` : HTMLテンプレート (map.html)
- `terraform/` : AWS構成用Terraform
- `notebook/` : Jupyter Notebook
- `data/` : GISデータ

## Author

- 土屋 健 (Takeru Tsuchiya)
- Contact: tata.5593@gmail.com
