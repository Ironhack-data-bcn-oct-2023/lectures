import os
import pandas as pd
def downloading (url, name):
    command = f"curl {url} > data/{name}.csv"
    os.system(command)
    return pd.read_csv(f"data/{name}.csv")
