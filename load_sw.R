
# AUD -----------------------------------------------------------------------------------------

randAUD <- read_rds(paste0(savedir1, 'randAUD.RDS'))

richAUD <- randAUD$rich
richAUD <- richAUD[complete.cases(richAUD)]
smallAUD <- randAUD$small
rnetsAUD <- randAUD$rand

swAUD <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swAUD[[i]] <- smallAUD[threshold == i] }


# CON -----------------------------------------------------------------------------------------

randCON <- read_rds(paste0(savedir1, 'randCON.RDS'))

richCON <- randCON$rich
richCON <- richCON[complete.cases(richCON)]
smallCON <- randCON$small
rnetsCON <- randCON$rand

swCON <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swCON[[i]] <- smallCON[threshold == i] }


# DAN -----------------------------------------------------------------------------------------

randDAN <- read_rds(paste0(savedir1, 'randDAN.RDS'))

richDAN <- randDAN$rich
richDAN <- richDAN[complete.cases(richDAN)]
smallDAN <- randDAN$small
rnetsDAN <- randDAN$rand

swDAN <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swDAN[[i]] <- smallDAN[threshold == i] }


# DMN -----------------------------------------------------------------------------------------

randDMN <- read_rds(paste0(savedir1, 'randDMN.RDS'))

richDMN <- randDMN$rich
richDMN <- richDMN[complete.cases(richDMN)]
smallDMN <- randDMN$small
rnetsDMN <- randDMN$rand

swDMN <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swDMN[[i]] <- smallDMN[threshold == i] }


# FPN -----------------------------------------------------------------------------------------

randFPN <- read_rds(paste0(savedir1, 'randFPN.RDS'))

richFPN <- randFPN$rich
richFPN <- richFPN[complete.cases(richFPN)]
smallFPN <- randFPN$small
rnetsFPN <- randFPN$rand

swFPN <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swFPN[[i]] <- smallFPN[threshold == i] }


# SAL -----------------------------------------------------------------------------------------

randSAL <- read_rds(paste0(savedir1, 'randSAL.RDS'))

richSAL <- randSAL$rich
richSAL <- richSAL[complete.cases(richSAL)]
smallSAL <- randSAL$small
rnetsSAL <- randSAL$rand

swSAL <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swSAL[[i]] <- smallSAL[threshold == i] }


# SMH -----------------------------------------------------------------------------------------

randSMH <- read_rds(paste0(savedir1, 'randSMH.RDS'))

richSMH <- randSMH$rich
richSMH <- richSMH[complete.cases(richSMH)]
smallSMH <- randSMH$small
rnetsSMH <- randSMH$rand

swSMH <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swSMH[[i]] <- smallSMH[threshold == i] }


# SMM -----------------------------------------------------------------------------------------

randSMM <- read_rds(paste0(savedir1, 'randSMM.RDS'))

richSMM <- randSMM$rich
richSMM <- richSMM[complete.cases(richSMM)]
smallSMM <- randSMM$small
rnetsSMM <- randSMM$rand

swSMM <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swSMM[[i]] <- smallSMM[threshold == i] }


# SUB -----------------------------------------------------------------------------------------

randSUB <- read_rds(paste0(savedir1, 'randSUB.RDS'))

richSUB <- randSUB$rich
richSUB <- richSUB[complete.cases(richSUB)]
smallSUB <- randSUB$small
rnetsSUB <- randSUB$rand

swSUB <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swSUB[[i]] <- smallSUB[threshold == i] }


# UNC -----------------------------------------------------------------------------------------

randUNC <- read_rds(paste0(savedir1, 'randUNC.RDS'))

richUNC <- randUNC$rich
richUNC <- richUNC[complete.cases(richUNC)]
smallUNC <- randUNC$small
rnetsUNC <- randUNC$rand

swUNC <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swUNC[[i]] <- smallUNC[threshold == i] }


# VIS -----------------------------------------------------------------------------------------

randVIS <- read_rds(paste0(savedir1, 'randVIS.RDS'))

richVIS <- randVIS$rich
richVIS <- richVIS[complete.cases(richVIS)]
smallVIS <- randVIS$small
rnetsVIS <- randVIS$rand

swVIS <- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swVIS[[i]] <- smallVIS[threshold == i] }


# Whole brain ---------------------------------------------------------------------------------

randWB <- read_rds(paste0(savedir1, 'randWB.RDS'))

richWB <- randWB$rich
richWB <- richWB[complete.cases(richWB)]
smallWB <- randWB$small
rnetsWB <- randWB$rand

swWB<- vector("list", length = length(thresholds))
    for (i in seq_along(thresholds)){ swWB[[i]] <- smallWB[threshold == i] }
