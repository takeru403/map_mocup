import pandas as pd

class Clean_df:
    """
    データフレームの前処理を行うクラス。
    主にカラム名のクリーニングやデータの整形をサポートします。
    """
    def __init__(self, df: pd.DataFrame):
        """
        初期化メソッド。

        Args:
            df (pd.DataFrame): 前処理対象のデータフレーム。
        """
        self.df = df

    def clean_pop_df(self, pop_df: pd.DataFrame) -> pd.DataFrame:
        """
        DataFrameのカラム名から空白を削除するメソッド。

        Args:
            pop_df (pd.DataFrame): 前処理対象のデータフレーム。

        Returns:
            pd.DataFrame: カラム名の空白が削除されたデータフレーム。
        """
        pop_df.columns = pop_df.columns.str.strip()
        return pop_df

