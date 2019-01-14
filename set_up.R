
# Packages and functions --------------------------------------------------

pacman::p_load(brainGraph, data.table, tidyverse, reshape2, 
               foreach, doParallel, plyr, afex, GGally, ggpubr)

registerDoParallel(cores=3)


# Functions -----------------------------------------------------------------------------------

source('custom_functions.R')


# Location dependency -----------------------------------------------------

#Tango
# home <- '/run/media/sofdez/Alpha/addimex_conn/derivatives/graphs/'
#Huasteca
home <- '/media/neuroimagen/Alpha/addimex_conn/derivatives/graphs/'


# Constants ---------------------------------------------------------------

today <- format(Sys.Date(), '%m-%y')
savedir <- paste0(home, 'brainGraph/')
savedir1 <- paste0(savedir, today, "_")
groups <- c('Control', 'User')
atlas <- "power"
modality <- 'fmri'
covars <- fread("participants_pwr.tsv", na.strings = "n/a")
    names(covars) <- c("Study.ID",
                       "Group",
                       "Sex",
                       "Age",
                       "EducLevel",
                       "Laterality",
                       "AdminRoute",
                       "YearsConsumption",
                       "AgeOnset",
                       "DaysSinceUse",
                       "WeeklyDose",
                       "SmokeLYear",
                       "CigsDay",
                       "SmokeYears",
                       "SmokeOnset")
    covars[, Group := factor(Group, labels = c("Control", "User"))]
    covars[, Sex := factor(Sex, labels = c("Male", "Female"))]
    covars[, EducLevel := factor(EducLevel, levels = c(1:7),
                                 labels = c("Elementary", "MiddleSchool", "HighSchool",
                                 "Technical", "Bachelor", "Master", "Doctorate"))]
    covars[, Laterality := factor(Laterality, labels = c("RightH", "LeftH", "Ambidex"))]
    covars[, AdminRoute := factor(AdminRoute, labels = c("NonUser", "Nasal", "Smoking", "Both"))]
    covars[, WeeklyDose := factor(WeeklyDose, labels = c("0gr", "0.33", "0.33-0.66gr", "1-4gr", 
                                                         "4-8gr", "8-10gr", "+10gr"))]
    covars[, SmokeLYear := factor(SmokeLYear, labels = c("No", "Yes"))]
    covars[, CigsDay := factor(CigsDay, labels = c("0", "1-5", "6-10", "11-15", "16-20",
                                                   "+21"))]
    setkey(covars, Group, Study.ID)
inds <- mk_inds(covars)

