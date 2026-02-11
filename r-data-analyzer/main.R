# ==========================================================
# R Module Project
# Project: Daily Actions & Mood Data Analyzer
# Author: Happiness Nonkululeko Ncube
# ==========================================================

# --- Load libraries ---
# ggplot2 is optional but recommended for nice plots
# If you don't have it: install.packages("ggplot2")
suppressWarnings(suppressMessages({
  library(ggplot2)
  library(dplyr)
}))

cat("=====================================\n")
cat(" Daily Actions & Mood Data Analyzer\n")
cat("=====================================\n\n")

# ---------------------------
# Function 1: Load CSV dataset
# ---------------------------
load_dataset <- function(file_path) {
  if (!file.exists(file_path)) {
    stop(paste("File not found:", file_path))
  }
  df <- read.csv(file_path, stringsAsFactors = FALSE)
  return(df)
}

# ---------------------------
# Function 2: Clean & prepare data
# ---------------------------
clean_data <- function(df) {
  # Convert date column to Date datatype
  df$date <- as.Date(df$date)

  # Convert numeric columns
  df$mood_before <- as.numeric(df$mood_before)
  df$mood_after <- as.numeric(df$mood_after)
  df$minutes <- as.numeric(df$minutes)

  # Add a calculated column (numeric datatype)
  df$mood_change <- df$mood_after - df$mood_before

  return(df) 
}

# ---------------------------
# Function 3: Classify mood change using case_when()
# ---------------------------
classify_mood_change <- function(df) {
  df <- df %>%
    mutate(
      mood_label = case_when(
        mood_change >= 2 ~ "Big Improvement",
        mood_change == 1 ~ "Improved",
        mood_change == 0 ~ "No Change",
        mood_change == -1 ~ "Worse",
        mood_change <= -2 ~ "Much Worse",
        TRUE ~ "Unknown"
      )
    )
  return(df)
}

# ---------------------------
# Function 4: Summary statistics
# ---------------------------
summarize_data <- function(df) {
  cat("----- DATA SUMMARY -----\n")
  cat("Total records:", nrow(df), "\n")
  cat("Unique students:", length(unique(df$student_id)), "\n")
  cat("Unique actions:", length(unique(df$action)), "\n\n")

  cat("Average mood before:", mean(df$mood_before), "\n")
  cat("Average mood after:", mean(df$mood_after), "\n")
  cat("Average mood change:", mean(df$mood_change), "\n\n")

  cat("Mood change labels count:\n")
  print(table(df$mood_label))
  cat("\n")
}

# ---------------------------
# Function 5: Loop through list of actions
# Requirement: loop with list/array
# ---------------------------
action_analysis <- function(df) {
  cat("----- ACTION ANALYSIS (Loop) -----\n")

  actions <- unique(df$action)   # list/array of actions

  for (a in actions) {
    subset_df <- df[df$action == a, ]
    avg_change <- mean(subset_df$mood_change)

    cat("Action:", a, "| Records:", nrow(subset_df),
        "| Avg mood change:", round(avg_change, 2), "\n")
  }
  cat("\n")
}

# ---------------------------
# Function 6: Create charts and save output
# ---------------------------
create_charts <- function(df) {
  # Chart 1: Mood change per action
  p1 <- ggplot(df, aes(x = action, y = mood_change)) +
    geom_boxplot() +
    labs(
      title = "Mood Change by Action",
      x = "Action",
      y = "Mood Change (After - Before)"
    ) +
    theme_minimal()

  ggsave("output/mood_change_by_action.png", plot = p1, width = 8, height = 5)

  # Chart 2: Average mood change per action
  action_avg <- df %>%
    group_by(action) %>%
    summarise(avg_mood_change = mean(mood_change))

  p2 <- ggplot(action_avg, aes(x = action, y = avg_mood_change)) +
    geom_col() +
    labs(
      title = "Average Mood Change per Action",
      x = "Action",
      y = "Average Mood Change"
    ) +
    theme_minimal()

  ggsave("output/avg_mood_change.png", plot = p2, width = 8, height = 5)

  cat("Charts saved to /output folder.\n\n")
}

# ---------------------------
# MAIN PROGRAM
# ---------------------------

# Different datatypes demonstration
project_name <- "MindWink Mood Analyzer"     # character
version <- 1.0                              # numeric
is_complete <- FALSE                        # logical
today_date <- Sys.Date()                    # Date
actions_list <- list("Study", "Exercise")   # list

cat("Project:", project_name, "\n")
cat("Version:", version, "\n")
cat("Complete:", is_complete, "\n")
cat("Today:", today_date, "\n")
cat("Example list:", paste(actions_list, collapse = ", "), "\n\n")

# Load, clean, classify
data_file <- "data/actions_moods.csv"
df <- load_dataset(data_file)
df <- clean_data(df)
df <- classify_mood_change(df)

# Print first rows
cat("----- FIRST 5 ROWS -----\n")
print(head(df, 5))
cat("\n")

# Use dataframe + summarization
summarize_data(df)

# Loop requirement
action_analysis(df)

# Charts
create_charts(df)

cat("=====================================\n")
cat(" Program finished successfully ✅\n")
cat("=====================================\n")
