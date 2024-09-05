## ------------------------------------------------------------------------------------------------------------------------
#| echo: false
#| message: false
library(here)


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## getwd()
# used to obtain working directory

## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## setwd()
#used to change working directory
# you want to have your bib file with your markdown file


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## setwd("C:\\Users\\Brian\\path\\only\\that\\Brian\\has")
# this is very specific to someones code/computer - you will have to edit the setwd commands everytime.

## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## setwd("/Users/bcaffo/data")
## setwd("~/Desktop/files/data")
## setwd("C:\\Users\\Michelle\\Downloads")

#C: -> for windows computers and ~ -> for mac computers

## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## setwd("../data")
## setwd("../files")
## setwd("..\tmp")

# 2 dots up 1 folder, forward slash to go

## ------------------------------------------------------------------------------------------------------------------------
getwd()
list.files()


## ------------------------------------------------------------------------------------------------------------------------
library(here)

#Helps you locate files, where in directory you are and if there is a git directory
# Have R files in same directory

list.files(here::here())

#here::here -> path to .git project - goes up one directory to check it. So, need to link your R with git cloud
# can be used to specify directories, everyone should have under the same project
# you can then locate specific files/notes based on the name of the file

list.files(here("data"))

#this will show up all the data files you have in the cloud
# to have access to the class, have git linked


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## if (!file.exists(here("my", "relative", "path"))) {
##     dir.create(here("my", "relative", "path"))
## }
## list.files(here("my", "relative", "path"))


## ------------------------------------------------------------------------------------------------------------------------
df <- read.csv(here("data", "team_standings.csv"))
df


## ------------------------------------------------------------------------------------------------------------------------
df$Team


## ------------------------------------------------------------------------------------------------------------------------
here("data", "team_standings.csv")


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## source(here::here("functions.R"))


## ----save-r-data-formats, echo = FALSE, fig.cap = "Save data into R data file formats: RDS and RDATA"--------------------
knitr::include_graphics("http://www.sthda.com/sthda/RDoc/images/save-data-into-r-data-formats.png")


## ------------------------------------------------------------------------------------------------------------------------
x <- 1:5
save(x, file = here("data", "x.Rda"))
saveRDS(x, file = here("data", "x.Rds"))
list.files(path = here("data"))


## ------------------------------------------------------------------------------------------------------------------------
new_x1 <- readRDS(here("data", "x.Rds"))
new_x1


## ------------------------------------------------------------------------------------------------------------------------
new_x2 <- load(here("data", "x.Rda"))
new_x2


## ----message=FALSE-------------------------------------------------------------------------------------------------------
file.remove(here("data", "x.Rda"))
file.remove(here("data", "x.Rds"))
rm(x)


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## x <- 1:5
## y <- x^2
## save(x, y, file = here("data", "x.Rda"))
## new_x2 <- load(here("data", "x.Rda"))


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## file.remove(here("data", "x.Rda"))


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## data <- read.table("foo.txt")


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## initial <- read.table("datatable.txt", nrows = 100)
## classes <- sapply(initial, class)
## tabAll <- read.table("datatable.txt", colClasses = classes)


## ----echo = FALSE--------------------------------------------------------------------------------------------------------
readr_functions <- data.frame(
  func = c(
    "`read_csv()`",
    "`read_csv2()`",
    "`read_tsv()`",
    "`read_delim()`",
    "`read_fwf()`",
    "`read_log()`"
  ),
  file_type = c(
    "Reads comma-separated file",
    "Reads semicolon-separated file",
    "Reads tab-separated file",
    "General function for reading delimited files",
    "Reads fixed width files",
    "Reads log files"
  )
)
knitr::kable(readr_functions, col.names = c("`readr` function", "Use"))


## ----echo=TRUE-----------------------------------------------------------------------------------------------------------
library(readr)
teams <- read_csv(here("data", "team_standings.csv"))
teams


## ------------------------------------------------------------------------------------------------------------------------
read_csv("The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3",
         skip = 2
)


## ------------------------------------------------------------------------------------------------------------------------
read_csv("# A comment I want to skip
  x,y,z
  1,2,3",
         comment = "#"
)


## ------------------------------------------------------------------------------------------------------------------------
teams <- read_csv(here("data", "team_standings.csv"),
                  col_types = "cc"
)


## ------------------------------------------------------------------------------------------------------------------------
logs <- read_csv(here("data", "2016-07-19.csv.bz2"),
                 n_max = 10
)


## ------------------------------------------------------------------------------------------------------------------------
logs <- read_csv(here("data", "2016-07-19.csv.bz2"),
                 col_types = "ccicccccci",
                 n_max = 10
)
logs


## ------------------------------------------------------------------------------------------------------------------------
logdates <- read_csv(here("data", "2016-07-19.csv.bz2"),
                     col_types = cols_only(date = col_date()),
                     n_max = 10
)
logdates


## ------------------------------------------------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()
