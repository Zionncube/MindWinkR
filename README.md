MindWink Mood Analyzer — R Module Project

Author: Happiness Nonkululeko Ncube


Project Overview

The MindWink Mood Analyzer is an R data analysis program that studies how daily actions affect student mood. The program loads a dataset from a CSV file, calculates mood changes before and after activities, classifies emotional trends, and generates visual charts.

This project demonstrates real-world data analysis using R


Project Objectives

This program is designed to:

* Load and process real CSV data
* Clean and transform datasets
* Calculate mood differences numerically
* Classify emotional outcomes using conditional logic
* Generate statistical summaries
* Analyze actions using loops
* Create and save data visualizations

The goal is to understand how specific activities influence emotional well-being.


Dataset Description

The dataset (`actions_moods.csv`) includes:

date— Date of the activity
student_id— Unique identifier for each student
action— Activity performed (e.g., Study, Exercise)
minutes — Time spent on the activity
mood_before — Mood rating before activity
mood_after— Mood rating after activity

The program calculates a new field:

mood_change = mood_after − mood_before

Requirements

Software

* R (version 4.0 or later)
* RStudio (recommended)

Libraries

Install required packages if needed:


install.packages("ggplot2")
install.packages("dplyr")

The program automatically loads:

ggplot2 — for charts
dplyr — for data manipulation

How to Run the Program

1. Open the project folder in RStudio or VS Code.
2. Ensure the dataset is located at:

data/actions_moods.csv

3. Create an output folder if it does not exist:

output/

4. Run the script:


source("main.R")

5. The console will display summaries and analysis.
6. Charts will be saved in the output folder.

Results Summary (Current Dataset)

Based on the 15 records in the provided CSV, the program reports:

* The script calculates mood_change = mood_after - mood_before.
* Average mood before: 2.67
* Average mood after: 3.60
* Average mood change: +0.93 (overall improvement)

Mood label counts:

* Big Improvement: 8
* Improved: 3
* Worse: 2
* Much Worse: 2

Action analysis (average mood change):

* Exercise and Meditation show the strongest positive change (+2).
* Study is positive (+1.5).
* Social Media is strongly negative (-2).
* Gaming is slightly negative (-1).

Note: The program prints the date as a number (days since 1970), so "Today: 20494" is normal in console output.

Program Features

1. Data Loading

* Reads CSV data using a custom function
* Validates file existence

2. Data Cleaning

* Converts date and numeric values
* Creates calculated mood_change column

3. Mood Classification

Uses conditional logic to label emotional trends:

* Big Improvement
* Improved
* No Change
* Worse
* Much Worse

4. Summary Statistics

Displays:

* Total records
* Unique students
* Average mood values
* Mood category counts

5. Loop-Based Action Analysis

The program loops through all actions and calculates:

* Average mood change per activity
* Record counts

6. Data Visualization

Generates two charts:

* Mood change distribution by action (boxplot)
* Average mood change per action (bar chart)

Charts are automatically saved as PNG files.

Output Files

The program creates:


output/mood_change_by_action.png
output/avg_mood_change.png


These visualizations summarize emotional trends.

Concepts Demonstrated

This project demonstrates core R programming concepts:

* Functions
* Dataframes
* Lists and loops
* Conditional logic
* CSV file handling
* Numeric calculations
* Data visualization
* Modular program structure

Future Improvements

Potential enhancements include:

* Interactive dashboards
* Larger datasets
* Machine learning predictions
* Real-time data collection
* User input interfaces

Hours Worked

Total time spent: 20+ hours over 2 weeks.

Sprint Hours Details

Day | First Week of Sprint | Second Week of Sprint
--- | --- | ---
Monday | Setup project folder in VSCode, install R + extensions, review module requirements (2 hrs) | Refactor code for readability, improve functions and comments (2 hrs)
Tuesday | Create or select CSV dataset, inspect columns, plan analysis questions (2 hrs) | Add error handling + input validation, test with missing values (2 hrs)
Wednesday | Write R code to load CSV into dataframe, clean data, compute mood_change (2 hrs) | Create visualizations (boxplot/bar chart), save images to output folder (2 hrs)
Thursday | Implement case_when() classification + loop analysis per action (2 hrs) | Create README.md using template, document requirements met (2 hrs)
Friday | Debug and test script end-to-end, ensure outputs display correctly (1 hr) | Final polishing: check rubric, verify all requirements, final run recording (1 hr)
Saturday | Write short summary of results, organize repo, backup project (1 hr) | Submit project + backup files + final review (1 hr)

## Video Demo
[Watch the demo video](https://youtu.be/RourBmkpAq0)


What learning strategies worked well in this module and what strategies (or lack of strategy) did not work well? How can you improve in the next module?

During this R module, several learning strategies worked well for me. One strategy that helped a lot was learning by doing. Instead of only reading or watching videos, I practiced by building my own R project step by step. Writing functions, testing my code, and fixing errors helped me understand how R works in a practical way. Breaking the project into smaller parts (loading data, cleaning it, analyzing it, and creating charts) made the work feel manageable and helped me stay organized.

Another strategy that worked well was experimenting with the code. I tried changing values, running sections of the script multiple times, and observing how the output changed. This hands-on approach improved my confidence and helped me understand concepts like data frames, loops, and functions more clearly.

However, some strategies did not work as well. At times, I tried to move too quickly without fully understanding error messages or the structure of the project. This caused confusion and slowed me down later. I also realized that I did not always plan my workflow ahead of time. Jumping straight into coding without a clear plan sometimes made debugging harder.

For the next module, I can improve by spending more time planning before coding. I want to outline my steps, understand the requirements clearly, and review key concepts before starting. I will also focus on reading error messages more carefully and documenting my code with comments as I go. In addition, I plan to practice consistently instead of leaving too much work for one session. By improving my planning, pacing, and reflection, I can build stronger programming skills and work more efficiently in the next module.


Conclusion

The MindWink Mood Analyzer fulfills the requirements of the R module by performing meaningful data analysis and generating clear visual outputs. It demonstrates how R can be applied to study emotional trends and behavioral patterns in a real-world context.

