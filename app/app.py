from flask import Flask, render_template
import folium
import geopandas as gpd

app = Flask(__name__)

@app.route("/")
def map_view():
    # データ読み込み
    mesh_gdf = gpd.read_file("../data/mesh/神奈川/merged_mesh.shp")
    station_gdf = gpd.read_file("../data/train_stop/trainstop.shp")

    # 地図生成
    m = folium.Map(location=[35.33, 139.49], zoom_start=12)

    # メッシュの表示
    folium.GeoJson(mesh_gdf.geometry, name="Mesh").add_to(m)

    # 駅のマーカー
    for idx, row in station_gdf.iterrows():
        coords = row.geometry.coords[0]
        folium.CircleMarker(
            location=[coords[1], coords[0]],
            radius=3,
            color="blue",
            fill=True,
            fill_opacity=0.7
        ).add_to(m)

    # HTMLとして出力してテンプレートに渡す
    map_html = m._repr_html_()
    return render_template("map.html", map=map_html)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
