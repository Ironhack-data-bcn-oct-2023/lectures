import streamlit as st

st.write("Hi Page 2")

df=({'col1':[1,2,3,4],'col2':[5,6,7,8]})
st.table(df)
st.dataframe(df)