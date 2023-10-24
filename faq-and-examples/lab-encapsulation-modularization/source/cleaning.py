def basic_cleaning (df):
    df.drop(columns=["Unnamed: 0"], inplace=True)# "unnamed:_0" 
    df.columns = [i.lower().replace(" ", "-")   for i in df.columns]
    df.dropna(inplace=True)
    
    return df