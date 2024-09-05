install.packages(c("tidyverse", "dslabs"))
install.packages("ggplot2")
install.packages("reprex")
install.packages(c("here", "sessioninfo"))


# Reprex ------------------------------------------------------------------

#Reprex package -> when you run into issues, allows to run code in new session, save to clipboard history (code and output) and then you can save on new file and you can publish on git
#used to copy and past code into git for troubleshooting possible errors in online databases
#To run this, you need to copy the code you got the error from and past that in the brackets or just run after copying it.

reprex::reprex()


# Citations ---------------------------------------------------------------

# In R, each package has info automatically generated on how to site it  need citation function after creating the R markdown file.

citation("rmarkdown")
# this gives entry for references that you can copy and paste into citation manager

knitr::write_bib("rmarkdown", file = "my-refs.bib")
#will give you bibtext file that you can use directly

list.files()
#to see all files saved locally

#create bibtext entry and then

#Export bib file to desktop -> copy and past into bib file you are using and save it.
#Basically, keep a bibtext file with the references, which you can then do knitr and reference.

#In text reference
#[@key] for single citation
#[@key1; @key2] multiple citation can be separated by semi-colon
#[-@key] in order to suppress author name, and just display the year
#[see @key1 p 12; also this ref @key2] is also a valid syntax

#SciWheel -> collaborative reference manager

citation("tidyverse")

# For each project

## Create an Rstudio project
usethis::create_project("~/Desktop/biostat776project1")

## Start version controlling it
usethis::use_git()

## Use the gh-pages branch in order for
## GitHub pages https://pages.github.com/ to
## host our website.
usethis::git_default_branch_rename(to = "gh-pages")

## Create a .nojekyll file
writeLines("", here::here(".nojekyll"))

## Share it via GitHub with the world
usethis::use_github()

