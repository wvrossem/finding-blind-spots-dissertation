# README

## Useful commands

* Referencing
  + \@ref(intro)
  + \@ref(fig:nice-fig)
  + \@ref(tab:nice-tab)
* `code`
* [^footnote]
  + [^footnote]: footnote text

## Snippets

```{r figure-name, echo=FALSE, fig.cap="Caption.", out.width='80%', fig.asp=.75, fig.align='center'}
knitr::include_graphics("figures/figure.pdf")
```

## Setup

To install all the packages, run the following command:

```r
install.packages(c("rmarkdown", "bookdown", "pagedown", "kableExtra", "devtools"))
devtools::install_github("davidgohel/officer")
devtools::install_github("davidgohel/officedown")
devtools::install_github("davidgohel/flextable")
```
