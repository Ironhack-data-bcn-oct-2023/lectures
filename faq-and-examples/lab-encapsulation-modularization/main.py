import source.cleaning as cleaning
import source.downloading as down
import source.visualizing as viz

# 1. Imperative: notebook
# 2. Functional: notebook
# 3. Modules: create python files
    # Mopve the functions to the files you need
# 4. Import your own modules
# 5. On SRC you DEFINE on main you RUN

url = "https://raw.githubusercontent.com/Ironhack-data-bcn-oct-2023/lectures/main/datasets/avocado_kaggle.csv"
df = down.downloading(url, "df_10")
df_clean = cleaning.basic_cleaning(df)
viz.visualizing (df_clean, "image_ugly")


# PATH IS TAKEN FROM WHERE IT'S RAN