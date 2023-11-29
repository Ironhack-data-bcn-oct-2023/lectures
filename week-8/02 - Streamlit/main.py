import streamlit as st
import streamlit.components.v1 as components
from matplotlib import pyplot as plt
import numpy as np


st.set_page_config(page_title="Prueba", page_icon=":sunglasses:", layout="wide")

st.title("Prueba")
st.header("Introduction")
st.markdown("Voy a intentar probar todas las funciones básicas de streamlit")


st.subheader("Hola bon día :tornado:")

st.code('for i in range(8): foo()')

st.json({'foo':'bar','fu':'ba'})

#a = st.sidebar.radio('Select one:', [1, 2])

with st.sidebar:
    selection = st.radio('Select one:', [1, 2])

if selection == 1:
    st.write("¡Estás marcando 1!")
else:
    st.write("¡Estás marcando 2!")

st.multiselect("Buy", ["milk", "apples", "potatoes"])


col1, col2 = st.columns(2)
col1.write("This is column 1")
col2.write("This is column 2")

tab1, tab2 = st.tabs(["Tab 1", "Tab2"], )
with tab1:
    st.write("this is tab 1")
    st.image("Audi.jpg", width=200)
tab2.write("this is tab 2") #otra forma de escribir algo en una tab, poco útil si necesitas meter mucha info


select=st.radio('whats your favourite car?', options=('Audi', 'BMW', 'Ferrari'))
if select=='Audi':
    st.image('Audi.jpg')
    
if select=='BMW':
    x=np.linspace(0,10,100)
    fig=plt.figure()
    plt.plot(x, np.sin(x))
    st.write(fig)

val = st.text_input('Enter text')
print(val)
val = st.date_input('Enter date')
print(val)

df=({'col1':[1,2,3,4],'col2':[5,6,7,8]})
st.table(df)
st.dataframe(df)

code='''
print('hello world')'''
st.code(code)

st.image('audi.jpg', caption='hi', width=300)


def main():
    html_temp="""<div class='tableauPlaceholder' id='viz1685401556382' style='position: relative'><noscript><a href='#'><img alt='Story 1 ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Th&#47;TheofficeAnalysis_16781781282580&#47;Story1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='TheofficeAnalysis_16781781282580&#47;Story1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Th&#47;TheofficeAnalysis_16781781282580&#47;Story1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-GB' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1685401556382');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='1016px';vizElement.style.height='991px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
"""
    components.html(html_temp, width=1000, height=1000)

if __name__ == '__main__':
    main()

def main():
    # Inicializar el contador en 0 si aún no existe en el estado de la sesión
    if "counter" not in st.session_state:
        st.session_state.counter = 0

    # Agregar un botón en la aplicación
    if st.button("Presionar"):
        # Incrementar el contador en 1 cuando se presione el botón
        st.session_state.counter += 1
    
    # Mostrar el valor actual del contador
    st.write(f"Contador: {st.session_state.counter}")


if __name__ == '__main__':
    main()

