
import os
def visualizing (df, name):
    df.groupby("type").aggregate({"averageprice":"mean"})
    df.groupby("type").aggregate({"averageprice":"mean"}).plot.bar().get_figure().savefig(f'images/{name}')
    os.system(f"open images/{name}.png")
    
    # assert the image is there: ls
    
    print("Exported!")