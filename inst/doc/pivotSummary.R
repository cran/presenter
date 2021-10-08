## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(presenter)
library(dplyr)

## -----------------------------------------------------------------------------
iris %>% 
  summarize(across(where(is.numeric), mean), .groups = "drop") -> sumr0

sumr0

## -----------------------------------------------------------------------------

sumr0 %>% 
  pivot_summary()


## -----------------------------------------------------------------------------
iris %>% 
  group_by(Species) %>% 
  summarize(across(where(is.numeric), mean), .groups = "drop") -> sumr1

sumr1

## -----------------------------------------------------------------------------

sumr1 %>% 
  pivot_summary(Species)

## -----------------------------------------------------------------------------

iris %>%
  mutate(Species1 = sample(Species)) %>%
  group_by(Species, Species1) %>% 
  summarize(across(where(is.numeric), mean), .groups = "drop") -> sumr2
 
sumr2

## -----------------------------------------------------------------------------
sumr2 %>% 
   pivot_summary(matches("Spec")) 

