## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, warning=F, message=F----------------------------------------------
library(presenter)
library(dplyr)

iris %>% 
  sample_n(10) %>% 
  relocate(Species) %>% 
  head %>% 
  arrange(Species) -> iris1

iris %>% 
  mutate(Species_random = sample(Species)) -> iris2

header_words <- c("Sepal", "Petal")

## -----------------------------------------------------------------------------
iris1 %>% 
  make_flextable(header_words = header_words, last_id_col = 1)

## -----------------------------------------------------------------------------
iris1 %>% 
  make_flextable(header_words = header_words, last_id_col = 1, theme = "zebra_gold")

## -----------------------------------------------------------------------------
iris2 %>% 
  make_pivot_table(col1 = Species, col2 = Species_random, theme = "tron")

## -----------------------------------------------------------------------------
iris1 %>% 
  make_flextable(header_words = header_words, last_id_col = 1, theme = "vader")

## -----------------------------------------------------------------------------
iris2 %>% 
  make_pivot_table(col1 = Species, col2 = Species_random, theme = "vanilla")

## -----------------------------------------------------------------------------
iris1 %>% 
  make_flextable(header_words = header_words, last_id_col = 1, theme = "booktabs")

## -----------------------------------------------------------------------------
iris1 %>% 
  make_flextable(header_words = header_words, last_id_col = 1, theme = "alafoli")

