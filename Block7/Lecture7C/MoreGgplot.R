library(ggplot2)

ggplot(diamonds) + geom_bar(aes(x = cut, colour = cut, fill = cut))

library(dplyr)

my_sc <- ggplot(diamonds) +
    geom_point(aes(x = carat, y = price, colour = cut), alpha = 0.5) +
    labs(title = 'Diamonds are forever...', x = 'Carat', y = 'Price')

my_sc

my_sc <- ggplot(diamonds) +
   geom_point(aes(x = carat, y = price, colour = cut), alpha = 0.5) +
   labs(title = 'Diamonds are forever...', x = 'Carat', y = 'Price')
my_sc

my_sc <- my_sc +
    geom_hline(aes(yintercept = 5000)) +
    geom_vline(aes(xintercept = 1)) +
    theme_bw()
my_sc

ggplot(diamonds) + geom_bar(aes(x = cut, colour = cut, fill = cut))

ggplot(diamonds %>% filter(cut == "Ideal")) +
   geom_point(aes(x = carat, y = price), alpha = 0.5) +
   labs(title = 'Diamonds are forever...', x = 'Carat', y = 'Price')

my_sc + facet_grid(~ cut)

my_hist + facet_grid(color ~ cut)

my_sc + facet_grid(~ cut) + theme_minimal()

my_sc + facet_grid(~ cut) + theme_minimal()

my_sc + facet_grid(~ cut) + theme_dark()

# install.packages("ggthemes")

library(ggthemes)
my_sc + theme_wsj()
