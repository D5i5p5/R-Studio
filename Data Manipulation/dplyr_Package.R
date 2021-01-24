

#dplyr()

#filter() - Filters the data based on a condition
#selet()  - select columns of interest from data set
#arrange() - arrange data set values on ascending and descending order
#mutate() - it create new variables from existing variables
#summarise(with groupby) - used to perform analysis by commonly used operations such as min , max , count etc.

library(dplyr)
data("mtcars")
data("iris")
#creating local dataframe
df_cars = tbl_df(mtcars) 
df_cars
df_iris = tbl_df(iris)
df_iris

#use filter to filter data
filter(df_cars,cyl>4 & gear >4)

filter(df_iris,Species %in% c('setosa','virginica'))

#use select to pick columns by name
select(df_cars,cyl,mpg,hp)

select(df_cars,-cyl,-mpg) # use - to hide columns

select(df_cars, -c(cyl,mpg)) # hide a range of columns

select(df_cars,cyl:gear)

df_cars %>%
  select(cyl,wt,gear)%>%
  filter(wt>2) # perform multiple operations in one line

#arrange can be used to record rows
df_cars %>% 
  select(cyl,wt,gear) %>%
  arrange(wt)
df_cars %>% 
  select(cyl,wt,gear) %>%
  arrange(desc(wt))

#mutate 
df_cars %>%
  select(mpg,cyl)%>%
  mutate(newvariable=mpg*cyl)

newvariable=df_cars %>%
  mutate(newvariable=mpg*cyl)

#summaries
df_iris %>%
  group_by(Species)%>%
  summarise(Average=mean(Sepal.Length,na.rm = TRUE))

df_iris %>%
  group_by(Species)%>%
  summarise_each(funs(mean,n()),Sepal.Length,Sepal.Width)

df_iris %>%
  group_by(Species)%>%
  summarise_each(funs(mean,n()),Sepal.Length,Sepal.Width,Petal.Length)


#Rename
df_cars %>%
  rename(miles=mpg)






















((df$Sub.Category.counts())/length(df$Sub.Category)*100).plot

library(dplyr)
df %>%
  group_by(Sub.Category) %>%
  summarize(percent=100*n()/nrow(df))

table(df$Sub.Category)

ggplot(df,aes(x=Sub.Category)) + geom_bar()
ggplot(df,aes(x=Category)) + geom_bar()


ggplot(df,aes(x=Sub.Category))+geom_bar(aes(y=(..count..)/sum(..count..))) + scale_y_continuous(labels=scales::percent,name="Propertion")


df %>%
  count(Sub.Category) %>%
  mutate(percent=n/sum(n)*100)

df %>%
  count(Ship.Mode) %>%
  mutate(percent=n/sum(n)*100)


df %>%
  count(Ship.Mode) %>%
  mutate(percent=n/sum(n)*100)

df %>%
  select(Quantity,Sales,Ship.Mode) %>%
  group_by(Ship.Mode,Ship.Mode)







