library(here)
library(rmarkdown)
library(tidyverse)

################################################################################
# Download images
################################################################################
img_urls <- c("https://gist.githubusercontent.com/daroczig/3cf06d6db4be2bbe3368/raw/d16b3da080c149c88b5fd9722d3c3c02e4c8644d/number-of-submitted-packages-to-CRAN.png",
              "https://i0.wp.com/r4stats.com/wp-content/uploads/2017/06/Fig_2d_ScholarlyImpact2016.png",
              "https://i1.wp.com/r4stats.com/wp-content/uploads/2017/02/Fig-1c-R-v-SAS-2017-02-18.png",
              "http://sogrady-media.redmonk.com/sogrady/files/2018/08/lang.rank_.618-1.png")

download_image <- function(url) {
    filename <- basename(url)
    img_path <- here('img', filename)
    if (!file.exists(img_path))
        download.file(url, img_path, mode = 'wb')
}

if (!dir.exists(here("img"))) {
    dir.create(here("img"))
}

map(img_urls, download_image)

slides <- list.files(here("Rmd"), pattern="^[[:digit:]]")

################################################################################
# Render slides to pdfs
################################################################################

if (!dir.exists(here("pdf"))) {
    dir.create(here("pdf"))
}

# render to beamer presentation
for (file in slides) {
    path <- here("Rmd", file)
    render(path, beamer_presentation(theme= "CambridgeUS",
                                     colortheme= "orchid",
                                     fonttheme= "structurebold"), 
           output_dir=here("pdf"))    
}

################################################################################
# Render slides to html
################################################################################

if (!dir.exists(here("html"))) {
    dir.create(here("html"))
}

for (file in slides) {
    path <- here("Rmd",file)
    render(path, ioslides_presentation(widescreen = TRUE), output_dir=here("html"))
}

################################################################################
# Render README to gitbub README 
################################################################################

render(here("Rmd","README.Rmd"), "md_document", output_dir=here())

################################################################################
# Render README to html
################################################################################

render(here("Rmd","README.Rmd"), "html_document", output_dir=here("html"))

################################################################################
# Render README to pdf
################################################################################


render(here("Rmd","README.Rmd"), 
       beamer_presentation(theme= "CambridgeUS",
                           colortheme= "orchid",
                           fonttheme= "structurebold",
                           keep_tex= TRUE
                           ),
       output_dir=here())


render(here("Rmd","01-basic-r.Rmd"), 
       beamer_presentation(theme= "CambridgeUS",
                           colortheme= "orchid",
                           fonttheme= "structurebold",
                           keep_tex= TRUE
       ),
       output_dir=here())

################################################################################
# Render script
################################################################################
library(stringr)

if (!dir.exists(here("script"))) {
    dir.create(here("script"))
}

for (file in slides) {
    path <- here("Rmd", file)
    knitr::purl(path, output=here("script", str_replace(file,"md$","")))
}
