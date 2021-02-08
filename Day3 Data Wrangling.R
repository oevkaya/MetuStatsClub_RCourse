
# Recall ------------------------------------------------------------------
source("SummaryFunction.R") # submit the R code to the current session 

SummaryLoc(iris$Sepal.Length)

# Data reading & writing --------------------------------------------------
# Reading
#install.packages("WriteXLS")

library(readr)
library(readxl)

chol <- read.table("chol.txt")  #All as factors

# Correct version
chol <- read_delim("chol.txt", "\t", escape_double = FALSE, 
                   trim_ws = TRUE)

borsa <- read.csv("C:/Users/ozan/Desktop/METU STATS CLUB R LECTURES/borsaverileri.csv", header=T) 

borsa1 <- read_excel("C:/Users/ozan/Desktop/METU STATS CLUB R LECTURES/borsa verileri.xlsx")

#readxl::read_excel("dataset.xlsx", sheet = 2)

# NOTES about other data reads:
# library(haven)
# # SAS
# read_sas("dataset.sas7bdat")
# # SPSS
# read_sav("dataset.sav")
# # Stata
# read_dta("dataset.dta")


scan() #read data for one variable from a text file,

load("c:/ozan/Desktop/METU STATS CLUB R LECTURES/Day1Rdata.RData") #load a R data frame


# Writing
# write() #write the values of a variable y in a file data.txt by write(y,file=mydata.txt)

# TRY for data frame
agg_mean
is.data.frame(agg_mean)
write.table(agg_mean,"dataset.txt")
write_csv(agg_mean, "dataset.csv")

sink() # the text output will be appended to the file myoutput
dev.off()

# About Saving
pdf("filename.pdf") # PDF file
png("filename.png") # PBG file
jpeg("filename.jpg") # JPEG file
postscript("filename.ps") # PostScript file

# Subset Function ---------------------------------------------------------
data()

?subset
names(starwars)
class(starwars)

head(starwars)
summary(starwars)

df2 <- subset(starwars, subset = (mass > 100 & homeworld == 'Tatooine') )
df2
nrow(starwars)
nrow(df2)

df3 <- subset(starwars , subset = (mass > 100 & homeworld == 'Tatooine'), 
              select = c(name , mass, height) ) 

df3
nrow(df3)

df4 <- subset(starwars , subset = (mass > 100 | homeworld == 'Tatooine') ) 

df4

# About Data wrangling 
# Short notes for dpylr grammer 

# Dplyr Functions ---------------------------------------------------------
# installing
install.packages('dplyr')

# calling it
library(dplyr)

# dplyr provides a set of verbs that help us solve the most common data
# manipulation challenges while working with tabular data (dataframes, tibbles):
  
# dplyr aims to provide a function for each basic verb of data manipulation.
# These verbs can be organised into three categories based on the component of the dataset that they work with:

# 1. Rows:
# filter() chooses rows based on column values.
# slice() chooses rows based on location.
# arrange() changes the order of the rows.

# 2. Columns:
# select() changes whether or not a column is included.
# rename() changes the name of columns.
# mutate() changes the values of columns and creates new columns.

# relocate() changes the order of the columns.
# 3. Groups of rows:
# summarise() collapses a group into a single row.


# Syntax ------------------------------------------------------------------

# the first argument is always a data.frame or tibble
# the subsequent arguments provide the information required for the verbs to take action
# the name of columns in the data need not be surrounded by quotes

chol_tibble = as_tibble(chol)
head(chol_tibble)

# Classical Usage 
# filter()
filter(chol, BLOOD == "a")
filter(chol_tibble, BLOOD == "a")

# Shortcut: Ctrl+Shift+M (Windows) and Cmd+Shift+M (Mac)
# Usage of pipe
chol %>%
  filter(SMOKE=="sigare")

chol %>%
  filter(MORT=="dead") 

chol %>%
  filter(SMOKE=="sigare" | MORT=="dead") # Change by &

# without Pipe operator
select(filter(chol, SMOKE=="sigare"), AGE)

chol_age <- chol %>%
  filter(SMOKE=="sigare") %>%
  select(AGE)

chol_age
class(chol_age)

colnames(chol)

# More select functions
# starts_with()
# ends_with()
# contains()
# matches()

chol %>%
  filter(SMOKE=="pipe") %>%
  select(BLOOD, starts_with("H")) # "h" also works

chol %>%
  filter(SMOKE=="pipe") %>%
  select(BLOOD, contains("H"))

# About arrange function

chol %>%
  filter(BLOOD=="a") %>%
  arrange(HEIGHT) #

chol %>%
  filter(BLOOD=="a") %>%
  arrange(desc(HEIGHT)) # OR desc()

# Mutate function 

BMI_chol <- chol %>%
  filter(MORT=="alive") %>%
  arrange(AGE) %>% 
  mutate(bmi = WEIGHT/(HEIGHT)^2)

class(BMI_chol)

BMI_chol %>% summary()

chol %>%
  filter(MORT=="alive") %>%
  arrange(AGE) %>% 
  transmute(bmi = WEIGHT/(HEIGHT)^2) # OR transmute ?


chol %>%
  filter(MORT=="alive") %>%
  arrange(AGE) %>% 
  mutate(bmi = WEIGHT/(HEIGHT)^2) %>% 
  select(AGE,SMOKE,bmi)

chol %>%
  filter(MORT=="alive") %>%
  arrange(AGE) %>% 
  mutate(bmi = WEIGHT/(HEIGHT)^2) %>% 
  select(AGE, HEIGHT, bmi) %>% 
  summarise(mean(bmi)) # You can add median

# Check summarise in help !

chol %>%
  filter(MORT=="alive") %>%
  arrange(AGE) %>% 
  mutate(bmi = WEIGHT/(HEIGHT)^2) %>% 
  select(AGE, HEIGHT, bmi) %>%
  summary()

# turn back to starwars data 
head(starwars)

# Eliminate NA example
starwars %>% filter(!is.na(hair_color))

starwars %>%
  filter(species=="Droid") %>%
  arrange(desc(mass)) %>%
  mutate(Veryold = ifelse(birth_year > 100, 1, 0)) %>% 
  select(name, Veryold)

starwars %>%
  filter(species=="Droid" & !is.na(birth_year)) %>%
  arrange(desc(mass)) %>%
  mutate(Veryold = ifelse(birth_year > 100, 1, 0)) %>% 
  select(name, Veryold)

# Groupby function usage 

starwars %>%
  group_by(species)

starwars %>%
  group_by(species) %>%
  summarise(
    n = n(),
    mass = mean(mass, na.rm = TRUE)
  )

# count() is useful when counting the number of cases (sample size) 
# for each level of a factor.

# Summarizing Data for groups
starwars %>% 
  group_by(skin_color) %>% 
  summarize(mean(height), sd(height), min(height), max(height), n())

# slice() lets you index rows by their (integer) locations. 
# It allows you to select, remove, and duplicate rows.

head(starwars)

starwars %>% slice(5:7)

# Give a name to get nicer tibble ?
head(chol)
class(chol)
# This is like a transposed version of print(): columns run down the page, 
# and data runs across. This makes it possible to see every column in a data frame.
help("glimpse")
Newchol <- glimpse(chol) 

class(Newchol)

# Tibble ------------------------------------------------------------------

# Type of joins
starwars$name
sample(starwars$name, 10)
df1 <- tibble(name = sample(starwars$name, 10), 
              grade = sample(c("AA", "BA", "BB", "DC"), 10, replace = T))
df1

df2 <- tibble(name = sample(starwars$name, 10), class = c(letters[10:1]))
df2

# use of merge, not practical for all cases
merge(df1,df2)

# use of dplyr
df1
df2
df1 %>% inner_join(df2)
df1 %>% left_join(df2)
df1 %>% right_join(df2)
df1 %>% full_join(df2)


# Some Statistics ---------------------------------------------------------

summary(chol)
var(chol$CHOL)
sd(chol$CHOL)

library(PerformanceAnalytics)
kurtosis(chol$HEIGHT)
skewness(chol$HEIGHT)

#scatterplot
plot(chol$HEIGHT, chol$CHOL)

# boxplot
boxplot(chol$CHOL) 

# correlation
Corrchol <- cor(chol[, c("AGE", "HEIGHT", "WEIGHT","CHOL")])

corrplot::corrplot(Corrchol, method="circle")
# change to number 
# add layout = upper

# matrix of the p-value of the correlation
require(corrplot)
p.mat <- cor.mtest(chol[, c("AGE", "HEIGHT", "WEIGHT","CHOL")])$p
p.mat

# Specialized the insignificant value according to the significant level
corrplot(Corrchol, type = "upper",  order = "hclust",
         p.mat = p.mat, sig.level = 0.01)

# OR insig = "blank"

# For further examples
# https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html

# BONUS: Mosaic package ----------------------------------------------------------
install.packages("mosaic")
library(mosaic)

# rflip(10)

class(HELPrct)
class(HELPrct$racegrp)
head(HELPrct)
inspect(HELPrct)

# Number of rows and columns
dim(HELPrct)
nrow(HELPrct)
ncol(HELPrct)

names(HELPrct)

HELPrct %>% 
  filter(!is.na(link)) %>% 
  select(link)

HELPrct$link
# Counts by category
tally(~ sex, data = HELPrct)
tally(~ racegrp, data = HELPrct, format = "percent")
# tally(~ sex, data = HELPrct, format="percent")

# Some plotting
# Bar graph of percentages
gf_percents(~ substance, data = HELPrct , fill = "cyan", color = "black")
pdf("Graph.pdf")
gf_percents(~ racegrp, data = HELPrct , fill = "cyan", color = "black")
dev.off()

# summary(HELPrct)
#Table of summary statistics
summary(HELPrct$cesd)
favstats(~ cesd , data = HELPrct)


gf_histogram(~ cesd , data = HELPrct)
gf_histogram(~ cesd , data = HELPrct, binwidth = 10)

# Normal probability plot
gf_qq(~ cesd , data = HELPrct)

# Classical way
qqnorm(HELPrct$cesd)
qqline(HELPrct$cesd, col=2)

# One sample t test
result <- t_test(~ cesd, data = HELPrct, mu = 34)
result

confint(result)
pval(result)


attach(HELPrct)

plot(cesd,d1)
plot(cesd,pss_fr)
plot(sexrisk,pss_fr)
plot(max_drinks, hospitalizations)

class(cesd); class(mcs)
qqnorm(cesd)
qqnorm(mcs)

plot(cesd, mcs)
# Correlation 
glimpse(HELPrct)

cor(cesd ~ mcs, data = HELPrct)

# Correlation chart
library(PerformanceAnalytics)
PerformanceAnalytics::chart.Correlation(HELPrct[c(1,4,20,21)])



library(corrplot)
cordat <- cor(HELPrct[c(1,4,5)], method = "pearson")
cordat
corrplot::corrplot(cordat, method = "number", type="upper")

# Linear Regression Model

Linmodel <- lm(cesd ~ mcs, data = HELPrct)
Linmodel
summary(Linmodel) # Preferable
msummary(Linmodel)

# More nicer output via pander package, not necessary, investigate !
library(pander)
pander::pander(Linmodel)

#Extract useful quantities
coef(Linmodel)
confint(Linmodel)
rsquared(Linmodel)

# To save as txt file
sink("LinModel.txt")
summary(Linmodel)
pander::pander(Linmodel)
sink()


# Some Further Resources -------------------------------------------------------

# https://mdogucu.github.io/intro-r-tidy/info.html#slides

# https://bookdown.org/rdpeng/rprogdatascience/

# https://techvidvan.com/tutorials/r-features/

# https://data-flair.training/blogs/learn-r-programming/

# In very different topics 
# https://rstudio.com/resources/books/

# About dplyr and tidyr
# https://jules32.github.io/2016-07-12-Oxford/dplyr_tidyr/

# https://cran.r-project.org/web/packages/dplyr/vignettes/base.html

# https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html

