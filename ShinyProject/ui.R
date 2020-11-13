##ui.R
##Crossfit Shiny Project

library(shinythemes)
fluidPage(theme = shinytheme("united"),
          
    titlePanel(h2("CrossFit Athlete Analyzer", align = "left")),
          
    sidebarLayout(position = "left",
                  sidebarPanel(
                    img(src = "crossfitlogo.jpg", align = "bottom",
                        height = 200, width = 200),
                    
                    br(),
                    
                    conditionalPanel(condition = "input.tabs1==1",
                        br(),
                        radioButtons('gender', 'Gender:', 
                                     choices = c('Male', 'Female'),
                                     inline = T),
                        br(),
                        radioButtons('age', 'Age:', 
                                     choices = c('Under 35', '35+ (Masters)'),
                                     inline = T),
                        br(),
                        radioButtons('bmi', 'BMI:', 
                                     choices = c('Under 25', '25+'),
                                     inline = T),
                        helpText(HTML("NOTE: BMI = Body Mass Index.
                                      <br>The formula is (weight lbs.) /
                                      (height inches)^2 x 703")),
                        br(),
                        radioButtons('benchmarks', 'Benchmark WODs:', 
                                     choices = c('Cardio', 'Weightlifting'),
                                     inline = T)),
                    
                    conditionalPanel(condition = "input.tabs1==2",
                        br(),
                        radioButtons('gender2', 'Gender:',
                                      choices = c('Male', 'Female')),
                        br(),
                        selectInput('benchmark', 'Benchmark Workout:', 
                                    choices = names(joined[, 8:19]),
                                    selected = names(joined[8])),
                        br(),
                        sliderInput('rankwin', 'Ranks:', min = 0, max = 50000, 
                                    value = 20000, step = 5000, round = 0)),
                    
                    conditionalPanel(condition = "input.tabs1==3",
                        br(),
                        radioButtons('gender3', 'Gender:',
                                     choices = c('Male', 'Female'),
                                     inline = T),
                        br(),
                        radioButtons('age3', 'Age:',
                                     choices = c('Under 35', '35+ (Masters)'),
                                     inline = T),
                        br(),
                        radioButtons('bmi2', 'BMI:',
                                     choices = c('Under 25', '25+'),
                                     inline = T),
                        br(),
                        sliderInput('rankstyle', 'Ranks:', min = 0, max = 100000, 
                                    value = 50000, step = 10000, round = 0),
                        br(),
                        selectInput('lifestyle', 'Lifestyle Factor:', 
                                    choices = c(names(joined[, 20:25]))),
                        )),
                  
                  mainPanel(
                    tabsetPanel(id = "tabs1",
                                
                                tabPanel("Benchmark Yourself", value=1,
                                         fluidRow(br(),
                                           h4("Cohort Benchmark Performance",
                                              align = "center"),
                                           br(),
                                         ),
                                         plotOutput("boxes")),
                                
                                tabPanel("Benchmark Competitors", value=2,
                                         fluidRow(br(),
                                           h4("Competitor Ranks vs. Benchmarks",
                                              align = "center")
                                         ),
                                         plotOutput("scattereds")),
                                
                                tabPanel("Lifestyle Factors", value=3,
                                         fluidRow(br(),
                                           h4("Athlete Survey Answers",
                                              align = "center")
                                         ),
                                         plotOutput("stackeds"))
                        ),
                    
                    hr(),
                    
                    fluidRow(
                      column(2,
                             h6("Fran"),
                             HTML("<small>1 RFT:
                                   <br>21-15-9
                                   <br>Thruster (95/65 lbs) 
                                   <br>Pullups</small>")),
                      column(2,
                             h6("Helen"),
                             HTML("<small>3 RFT: 
                                   <br>400M run 
                                   <br>21 KBS (1.5/1) 
                                   <br>12 Pullups</small>")),                      
                      column(2,
                             h6("Grace"),
                             HTML("<small>1 RFT: 
                                   <br>30 Clean & Jerks 
                                   <br>  (135/95 lbs)</small>")),                    
                      column(2,
                             h6("FightGoneBad"),
                             HTML("<small>3 Rounds for Reps 
                                  <br>(17 mins - 1 min/move):
                                   <br>1 min Wall Ball (20/14)
                                   <br>1 min SD HighPull (75/55)
                                   <br>1 min Box Jump (20in)
                                   <br>1 min Push Press (75/55) 
                                   <br>1 min Row (cals) 
                                   <br>1 min rest</small>")),                    
                      column(2,
                             h6("Filthy50"),
                             HTML("<small>For time:
                                   <br>50 Box Jump (24/20in)
                                   <br>50 Jump Pull Up 
                                   <br>50 KBS (1/.75 pood) 
                                   <br>50 Knees2Elbow 
                                   <br>50 Push Press (45/35) 
                                   <br>50 Back Extensions 
                                   <br>50 Wall Ball (20/14) 
                                   <br>50 Burpees 
                                   <br>50 Double-Unders</small>")),                    
                      column(2,
                             h6("Weightlifting"),
                             HTML("<small>One rep max.</small><br><br>"),
                             h6("Pullups"),
                             HTML("<small>Unbroken set</small>")),                    
                    )
                    )
          ))