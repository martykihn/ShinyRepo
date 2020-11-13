
#Shiny Project
#"CrossFit Athlete Analyzer"
#by Martin Kihn

#Online Part-Time Bootcamp
#Sept. Cohort

##DESCRIPTION:

This project and app analyzes data from CrossFit (athletic) competitions, as well as a survey of lifestyle patterns. The purpose of the Shiny App is to (a) provide a way for an athlete to benchmark their performance against their cohort; and (b) gain insights into the lifestyles of competition "winners" vs. others, in order to see what "winners do.


##BACKGROUND:

CrossFit is a community of athletes, affiliate gyms, and a global competition structure. It was founded in 2000 in Santa Cruz, CA and emphasizes "functional fitness," combinations of gymnastics and weightlifting exercises that mimic real-life movements.

Currently, there are about 20,000 affiliate gyms (called "boxes") and about 500K active athletes. The breakdown is about 50/50 male/female and international in flavor. CrossFit focuses on high-intensity training, nutrition (paleo) and community.

Competitions include the CrossFit Open, Regionals, and the CrossFit Games which is broadcast annually on ESPN.

Benchmark workouts-of-the-day (WODs) are often named (e.g., "Fran", "Nancy") and consist of a series of moves that help athletes gauge improvement and areas for development.


##DATA USED: (see below for more detail)

Two main sources of data were used: (1) athlete competitive ranks and scores for sanctioned events; (2) athlete self-reported data on WOD performance and lifestyle variables such as diet.


##MOTIVATING QUESTIONS:

* How does my performance compare to athletes in my cohort?
* Do cohort variables affect performance for certain WODs?
* How do "winners" compare to others in their lifestyle habits?


##WHAT I LEARNED:

Exploring the App, I arrived at the following conclusions:

#TAB 1:
* Running vs WODs - there is less variability (gender/age) and less spread from the media for running vs WODs
* BMI has more (negative) impact on performance than gender or age
* Weightlifting: more outliers at the high-end (strong freaks) than cardio
* Women about 40% under men in weightlifting & age has 10% impact
* BMI biggest predictor of diff. (higher is better) except pullups

#TAB 2:
* Steeper drop from elite (top 10K or so) than 15K+ to 50K: Fran, Grace, Helen -- from 0-10K about 10% drop & from 15-50% similar
* Appears to be diff b/t top 10K and rest (higher bump)
* FgoneBad dropoff from elite is steeper (to 15K)
* Running difference much flatter - less benefit to elite
* Dropoff seems deeper for weightlifting than cardio - out to 20K - maybe b/c more elite level weightlifters than cardio (esp snatch)
* Deadlift and Backsquat different - much flatter - suggesting less oppty to differentiate
* Women - steepest decline is pullups - chance to excel
--> weights in general declined more for women - thinner bench
--> also relatively fewer elites
--> also more dropoff in running - two areas to stand out

#TAB 3:
* FOOD: most people eat clean but don't measure - except older athletes who weigh & measure more - who also are more likely to eat paleo
* Higher BMIs more likely to eat for convenience (non-winners)
* Covenience eaters less prevalent among winners
* Winners more likely to have played h.s./college sports - but some had no b.g. at all - encouraging - particularly for women
[background - need to filter to top 10K vs others - sparse data for the other cuts]
* Experience: winners more likely to have started alone (no coach) & have attended specialty workshops
* women more likely to start w/ coach
* Biggest difference is number of workouts / day - winners do multiple - others don't
* Older athletes who are winners don't do rest days
* Howlong: winners have been doing it longer - but many only 1-2 years - so hang in there


##DATA SOURCES:

https://data.world/bgadoci/crossfit-data
https://www.kaggle.com/jeanmidev/crossfit-games

Two files were used:
athletes.csv (athlete survey data)
leaderboard.csv (competition data)

Note: these could be joined via the key "Athlete_ID" which is unique.


##DATA STRUCTURE:

dim(ath)
28 attributes
423,006 rows

dim(ldrbrd)
8 attributes
1,572,222 rows

colnames(ath):
1 athlete_id - int (4 digit #)

2 name - chr
3 region - chr (list)
4 team - chr
5 affiliate - chr

6 gender - chr (Male / Female)
7 age - int
8 height - int (inch)
9 weight - int (lbs)

10 fran - int (secs)
11 helen - int
12 grace - int
13 filthy50 - int
14 fgonebad - int
15 run400 - int
16 run5k - int
17 candj - int (lbs)
18 snatch - int
19 deadlift - int
20 backsq - int
21 pullups - num

22 eat - chr (list)
23 train - chr (list)
24 background - chr (list)
25 experience - chr (list)
26 schedule - chr (list)
27 howlong - chr (list)
28 retrived datetime - chr

colnames(ldrbrd):
1 year - int
2 division - int
3 stage - num
4 athlete_id - num (4 digit #)

5 rank - int (higher better)
6 score - int (higher better)

7 retrieved_datetime - chr (eg "2015-03-31 21:44:44"]
8 scaled - int (0=no 1=yes)


##DATA PREPARATION:

The primary challenge was missing data and "suspicious" data in some survey answers. Almost every row and column had numerous missing variables (NA).
I spent time cleaning the data -- removing rows with no data or missing key variables, such as gender or age.

To make the survey data more useful, I removed outliers. For example, a number of people self-reported running a 400K faster than the world record time. Obviously, this isn't possible. Non-sensical outliers were removed.

Rather than deal with height & weight separately, I created a variable called BMI that reflected both.
