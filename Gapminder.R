# R프로그래밍 문제 SET
# 
# Gapminder 데이터셋은 1960년부터 2016년까지 184개국의 국가별 경제 수준과 의료 수준 동향을 정리한 데이터셋입니다. 먼저 아래 명령어를 통해 데이터를 다운로드 및 불러옵니다.
install.packages('gapminder')
library(gapminder)
data("gapminder")


# 1.
# contry가 한국(Korea, Rep.) 인 행만 선택(filter 사용) 합니다.
# 그 후, [contry, year, pop, gdpPercap] 열만 선택(select 사용) 하며,
# pop을 천만단위

 #cf.
 #gapminder[gapminder$country == 'Korea, Rep.', c('country', 'year', 'pop', 'gdpPercap')]

install.packages("dplyr")
library(dplyr)
gapminder %>%filter(country =='Korea, Rep.', ) %>% select(country, year, pop, gdpPercap)

gapminder %>%filter(country =='Korea, Rep.', ) %>% select(country, year, pop, gdpPercap) %>% mutate('pop_10,000,000' = pop/10^7)

# 2.
# continent, year 그룹 별로 평균 수명(lifeExp)를 구합니다.
gapminder %>% group_by(continent, year) %>% summarise(lifeExp_n = mean(lifeExp))

# 3.
# 위에서 구한 값을 바탕으로 x축에는 연도, y축에는 평균수명으로 선 그래프를 나타내며 해당 결과를 해석합니다.
install.packages("ggplot2")
library(ggplot2)
gapminder %>% group_by(continent, year) %>% summarise(lifeExp_n = mean(lifeExp)) %>% ggplot(aes(year, lifeExp_n, col=continent)) + geom_point()+ geom_line()
