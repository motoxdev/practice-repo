df = read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/nba-elo/nbaallelo.csv")
df

# making a bunch of different plots 

# simple scatter plot
#plot(df$elo_i, df$opp_elo_i)

# simple bar plot
#barplot(df$elo_i, df$opp_elo_i)

# trend plot
library(plotly)
fig <- plot_ly(x = df$elo_i, y = df$opp_elo_i, type = 'scatter', mode = 'lines'
               , name = 'Share Prices (in USD)')%>% 
  layout(title = 'elo_i vs opp_elo_i',
         plot_bgcolor='#e5ecf6',  
         xaxis = list(  
           title = 'elo_i',
           zerolinecolor = '#ffff',  
           zerolinewidth = 2,  
           gridcolor = 'ffff'),  
         yaxis = list(  
           title = 'opp_elo_i',
           zerolinecolor = '#ffff',  
           zerolinewidth = 2,  
           gridcolor = 'ffff'),
         showlegend = TRUE, width = 1100)
fig

# scatter plot with best fit line
plot(df$elo_i, df$opp_elo_i, 
     col = ifelse(df$elo_i == "1", "blue", "red"),
     pch = ifelse(df$opp_elo_i == "1", 17, 19),
     main = "opp_elo_i vs opp_elo_n",
     xlab = "opp_elo_i",
     ylab = "opp_elo_n")
abline(lm(df$elo_i ~ df$opp_elo_i), col = "black")
