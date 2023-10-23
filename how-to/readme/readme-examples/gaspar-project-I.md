
# Shark Attacks 
### By: Gaspar Masdeu
### Date: July 18th 2022

![local_picture](./images/sharkie.jpg)

INTRO:
For this project, we start from the provided database, which is available from Global Shark Attacks 📚.


## Hypothesis:
#

## 1. The great white shark is the most lethal shark.
## 2. He likes to eat USA people more than anything, so he goes an extra mile to kill them.
## 3. He likes to eat surfers more than to eat swimmers.


## ORGANIZATION:
#

# 1. Cleanup:

After a brief exploration of the size and quality of the data, I proceed to a first basic roughing out.
In the following phases I went through the file by columns, evaluating the best way to extract the most data according to the content, the type of data and the usefulness it could provide us for future visualizations.
This process is documented in:
clean.ipynb commented file with the cleaning process.

cleaning_functions.py functions created ad hoc for cleaning and extraction.

clean_sharks.csv file obtained in the last step after the cleaning process.

# 2. Analysis:

Once the clean file has been obtained, several graphs have been made, relying on different libraries, in order to visually support the conclusions.

### First, let's do some general plotting to see when the attacks happen.

Most attacks happen during the weekend

![local_picture](./images/day_attack.jpg)

We can also observe that many of these attacks occur during the summer.

![local_picture](./images/month_attack.jpg)

What are the mains Activities during the attack?:

![local_picture](./images/activity_attack.png)

Check the function file if you want to know what sharkando is ;).

## Lets start with my hipothesis.

# 1. Is the Great White Shark the most lethal shark?

### Of course our favorite shark is the most agressive of all sharks...

![local_picture](./images/most_agressive.png)

### But is he the most efficient one?

![local_picture](./images/shark_efficiency.png)

## ITS A TIE!!! :(
In case of a tie, the shark with more kills wins. In this case, the great white shark is the savagest killer in the seas.

<img src="https://i.pinimg.com/originals/5b/d2/0c/5bd20c925e17f29e73ddaa4299766020.jpg" width="300" align="center">

Continuing with my hipotesis, let's see if he has a higher efficiency killing american people.

# 2. Is his favorite snack people from the USA?

<img src="https://preview.redd.it/jq5462t95ob51.jpg?auto=webp&s=339ec0cc1d0a696f3462449c9274eb25d007b04d" width="300" align="center"> 

#### I want to know where most of the attacks happens, and if that attack ends with a kill or not. I'm only interested in the great white shark attacks.

![local_picture](./images/country_attack_fatality.png)

## He is more efficient OUTSIDE USA.

It seems he is a better killer outside USA. So my hipothesis was wrong.
Let's see now if the greatest shark in the sea likes to eat surfers more than to eat swimmers.

# 3. He prefers american surfers more than american swimmers.

Let's take a look at the data of the victims of a Great White Shark attack.

<img src="https://c.tenor.com/ZmAnqvvODcYAAAAC/shark-sharky.gif" width="300" align="center"> 

If we check the incidence by sex we can see that the attacks are more frequent in young adult males than females:

![local_picture](./images/age_gender_victim.jpg)

We can also see that activities such as Surfing and Swimming tend to have more incidents in younger people between the ages 15 to 40.

![local_picture](./images/density_activity.jpg)

#### We can see the goat dearest victim is a male surfer between 20-40 years old, but we need to see the eficiency too. Let's get a good boxplot to illustrate it. 

![local_picture](./images/swimmer_surfer.png)

## My hipotesis was wrong. Swimmers >>>> Surfers.

For reasons beyond our understanding, the favorite dish of the great white shark is the swimmers/swimmers of the sea.

<img src="https://media0.giphy.com/media/3oEduN3VLFK87V2XuM/giphy.gif?cid=790b7611f69e9de8a1dc4a961015b50aa347db162e23239b&rid=giphy.gif&ct=g" width="300" align="center">  

## Thanks for reading!

