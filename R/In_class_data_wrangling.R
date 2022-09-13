library(mdsr)


CIACountries %>% 
  mutate(letter = substring(country, 1, 1)) %>%
  group_by((letter)) %>%
  summarize(total = sum(pop)) %>%
  arrange(desc(total))

CIACountries %>% group_by(net_users) %>% summarize(any_oil = mean(oil_prod >
                                                                    0, na.rm = TRUE))


