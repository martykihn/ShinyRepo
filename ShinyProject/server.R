##server.R
##Crossfit Shiny Project

function(input, output) {
  
  output$boxes = renderPlot({
    
    dfa = joined %>% filter(., gender == input$gender)
    dfa = if(input$age == 'Under 35') {
        dfa %>% filter(., age < 35)} else {
        dfa %>% filter(., age >= 35 & age < 65)}
    dfa = if(input$bmi == 'Under 25') {
        dfa %>% filter(., BMI < 25)} else {
        dfa %>% filter(., BMI >= 25 & BMI < 50)}

    if(input$benchmarks == 'Cardio') {
      
      par(mfrow = c(3,3))
      boxplot(dfa$fran, xlab = 'Seconds', main = 'Fran', col.main = "darkorange3",
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      boxplot(dfa$helen, xlab = 'Seconds', main = 'Helen', col.main = "darkorange3", 
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      boxplot(dfa$grace, xlab = 'Seconds', main = 'Grace', col.main = "darkorange3",
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      boxplot(dfa$fgonebad, xlab = 'Seconds', main = 'FightGoneBad', col.main = "darkorange3",
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      boxplot(dfa$filthy50, xlab = 'Seconds', main = 'Filthy50', col.main = "darkorange3",
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      boxplot(dfa$run400, xlab = 'Seconds', main = 'Run 400M', col.main = "darkorange3",
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      boxplot(dfa$run5k, xlab = 'Seconds', main = 'Run 5K', col.main = "darkorange3",
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      
    }
    
    else if(input$benchmarks == 'Weightlifting') {
      
      par(mfrow = c(2, 3))
      boxplot(dfa$candj, xlab = 'Pounds', main = 'CandJ', col.main = "darkorange3",
#             col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      boxplot(dfa$snatch, xlab = 'Pounds', main = 'Snatch', col.main = "darkorange3",
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      boxplot(dfa$deadlift, xlab = 'Pounds', main = 'Deadlift', col.main = "darkorange3", 
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      boxplot(dfa$backsq, xlab = 'Pounds', main = 'BackSquat', col.main = "darkorange3",
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      boxplot(dfa$pullups, xlab = 'Reps', main = 'Pullups', col.main = "darkorange3",
#              col = "cadetblue1", border = "cadetblue4",
              horizontal = T, cex.main = 2.0, cex.axis = 1.5, cex.lab = 1.5)
      
    }
    
    else {print("n/a")}
    
  })
  
  output$scattereds = renderPlot({
    
##smpl_joined is a random sample of joined for readabiiity in plot
##it was created in global.R
    
    temp1 = smpl_joined %>%
        filter(., gender == input$gender2) %>%
        filter(., ranks <= input$rankwin) %>%
        select(., ranks, input$benchmark)
    
    scatter.smooth(temp1[,1], temp1[,2], xlab = "Ranks", 
                  ylab = paste(as.character(input$benchmark), "(seconds/reps/lbs)"),
                  col = "darkorange3", bty = "n", cex.main = 1.4, cex.lab = 1.2)
##                  ylim = c(0, 10 * mean(temp1[,2])))
      
##      ggplot(temp1, aes(x = ranks, y = input$benchmark)) +
##      geom_point() + geom_smooth(method = 'lm')
    
  })
  
  output$stackeds = renderPlot({
    
    temp = joined %>% filter(., gender == input$gender3)
    temp = if(input$age3 == 'Under 35') {
      temp %>% filter(., age < 35)} else {
        temp %>% filter(., age >= 35 & age < 65)}
    temp = if(input$bmi2 == 'Under 25') {
      temp %>% filter(., BMI < 25)} else {
        temp %>% filter(., BMI >= 25 & BMI < 50)}
    
    temp_high = temp %>%
      filter(., ranks <= input$rankstyle) %>%
      select(., input$lifestyle)
    temp_high = table(temp_high)
    
    temp_low = temp %>%
      filter(., ranks > input$rankstyle) %>%
      select(., input$lifestyle)
    temp_low = table(temp_low)
    
    temp = cbind(temp_high, temp_low)
    temp = as.data.frame(temp)
    temp$high_pct = temp$temp_high / sum(temp$temp_high)
    temp$low_pct = temp$temp_low / sum(temp$temp_low)
    temp$temp_high = NULL
    temp$temp_low = NULL
    
    temp = as.matrix(temp)
    temp = temp[order(-temp[, 1]), ]

    colnames(temp) = c("Winners", "Others")
    
    mycolors = c("brown3", "darkorange2", "firebrick2",
                 "burlywood2", "darkorange", "brown1")
    
    barplot(temp,
            col = mycolors,
            border = "white",
            ylab = "Percent",
            xlim = c(0,7))
    legend("topright", legend = rownames(temp), fill = mycolors,
           bty = "n", text.font = 1, cex = 1.3, text.width = 4)

#    temp = temp %>%
#      filter(., ranks <= input$rankstyle) %>%
#      select(., input$lifestyle)
    
#    temp = sort(table(temp))
    
#    par(mar=c(5,26,4,1)+.1)
    
#    barplot(temp,
#            horiz = T, las = 2, col = "darkorange2", 
#            density = c(10, 30), border = NA,
#            xpd = F, xlab = "(Counts)", xlim = c(0, 3000),
#            cex.main = 1.4, cex.lab = 0.9, cex.names = 1.2)
    
  })
  
}