## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=F, warning=F----------------------------------------------
library(presenter)
library(dplyr)
library(ggplot2)
library(stringr)

## -----------------------------------------------------------------------------
diamonds %>% 
  select(-clarity) %>% 
  mutate(relative_price = price / max(price), .before = "x") %>% 
  group_by(across(where(is.ordered))) %>% 
  summarize(across(where(is.double), mean), .groups = "drop") %>% 
  format_percent(relative_price) %>% 
  rename_with(~str_c("category_", .), cut:color) %>% 
  rename_with(~str_c("property_", .), carat:table) %>% 
  rename_with(~str_c("dimension_", .), x:z) -> diamonds_summary

diamonds_summary %>% head

## -----------------------------------------------------------------------------
diamonds_summary %>% 
  make_flextable(last_id_col = 2,
                 # header_words = c("category", "property", "dimension"), 
                 theme = "zebra_gold")

## -----------------------------------------------------------------------------
tibble(x = letters[1:10],
       y = -5:4,
       z = -c(-.5, -.2, -.1, 0, .1, .2, .3, .4, .6, .9)) %>% 
  format_percent(z) %>% 
  rename_with(~str_c("sample_", .)) %>% 
  make_flextable()

## -----------------------------------------------------------------------------
tibble(x = letters[1:10],
       y = -5:4,
       z = -c(-.5, -.2, -.1, 0, .1, .2, .3, .4, .6, .9)) %>% 
  format_percent(z) %>% 
  make_flextable()

