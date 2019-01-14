
### CONSENSUS ### -----------------------------------------------------------------------------

# AUD -----------------------------------------------------------------------------------------

rand1AUD <- read_rds(paste0(savedir1, 'rand1AUD.RDS'))

rich1AUD <- rand1AUD$rich
rich1AUD <- rich1AUD[complete.cases(rich1AUD)]
small1AUD <- rand1AUD$small
rnets1AUD <- rand1AUD$rand

sw1AUD <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1AUD[[i]] <- small1AUD[threshold == i] }


# CON -----------------------------------------------------------------------------------------

rand1CON <- read_rds(paste0(savedir1, 'rand1CON.RDS'))

rich1CON <- rand1CON$rich
rich1CON <- rich1CON[complete.cases(rich1CON)]
small1CON <- rand1CON$small
rnets1CON <- rand1CON$rand

sw1CON <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1CON[[i]] <- small1CON[threshold == i] }


# DAN -----------------------------------------------------------------------------------------

rand1DAN <- read_rds(paste0(savedir1, 'rand1DAN.RDS'))

rich1DAN <- rand1DAN$rich
rich1DAN <- rich1DAN[complete.cases(rich1DAN)]
small1DAN <- rand1DAN$small
rnets1DAN <- rand1DAN$rand

sw1DAN <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1DAN[[i]] <- small1DAN[threshold == i] }


# DMN -----------------------------------------------------------------------------------------

rand1DMN <- read_rds(paste0(savedir1, 'rand1DMN.RDS'))

rich1DMN <- rand1DMN$rich
rich1DMN <- rich1DMN[complete.cases(rich1DMN)]
small1DMN <- rand1DMN$small
rnets1DMN <- rand1DMN$rand

sw1DMN <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1DMN[[i]] <- small1DMN[threshold == i] }


# FPN -----------------------------------------------------------------------------------------

rand1FPN <- read_rds(paste0(savedir1, 'rand1FPN.RDS'))

rich1FPN <- rand1FPN$rich
rich1FPN <- rich1FPN[complete.cases(rich1FPN)]
small1FPN <- rand1FPN$small
rnets1FPN <- rand1FPN$rand

sw1FPN <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1FPN[[i]] <- small1FPN[threshold == i] }


# SAL -----------------------------------------------------------------------------------------

rand1SAL <- read_rds(paste0(savedir1, 'rand1SAL.RDS'))

rich1SAL <- rand1SAL$rich
rich1SAL <- rich1SAL[complete.cases(rich1SAL)]
small1SAL <- rand1SAL$small
rnets1SAL <- rand1SAL$rand

sw1SAL <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1SAL[[i]] <- small1SAL[threshold == i] }


# SMH -----------------------------------------------------------------------------------------

rand1SMH <- read_rds(paste0(savedir1, 'rand1SMH.RDS'))

rich1SMH <- rand1SMH$rich
rich1SMH <- rich1SMH[complete.cases(rich1SMH)]
small1SMH <- rand1SMH$small
rnets1SMH <- rand1SMH$rand

sw1SMH <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1SMH[[i]] <- small1SMH[threshold == i] }


# SMM -----------------------------------------------------------------------------------------

rand1SMM <- read_rds(paste0(savedir1, 'rand1SMM.RDS'))

rich1SMM <- rand1SMM$rich
rich1SMM <- rich1SMM[complete.cases(rich1SMM)]
small1SMM <- rand1SMM$small
rnets1SMM <- rand1SMM$rand

sw1SMM <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1SMM[[i]] <- small1SMM[threshold == i] }


# SUB -----------------------------------------------------------------------------------------

rand1SUB <- read_rds(paste0(savedir1, 'rand1SUB.RDS'))

rich1SUB <- rand1SUB$rich
rich1SUB <- rich1SUB[complete.cases(rich1SUB)]
small1SUB <- rand1SUB$small
rnets1SUB <- rand1SUB$rand

sw1SUB <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1SUB[[i]] <- small1SUB[threshold == i] }


# UNC -----------------------------------------------------------------------------------------

rand1UNC <- read_rds(paste0(savedir1, 'rand1UNC.RDS'))

rich1UNC <- rand1UNC$rich
rich1UNC <- rich1UNC[complete.cases(rich1UNC)]
small1UNC <- rand1UNC$small
rnets1UNC <- rand1UNC$rand

sw1UNC <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1UNC[[i]] <- small1UNC[threshold == i] }


# VIS -----------------------------------------------------------------------------------------

rand1VIS <- read_rds(paste0(savedir1, 'rand1VIS.RDS'))

rich1VIS <- rand1VIS$rich
rich1VIS <- rich1VIS[complete.cases(rich1VIS)]
small1VIS <- rand1VIS$small
rnets1VIS <- rand1VIS$rand

sw1VIS <- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1VIS[[i]] <- small1VIS[threshold == i] }


# Whole brain ---------------------------------------------------------------------------------

rand1WB <- read_rds(paste0(savedir1, 'rand1WB.RDS'))

rich1WB <- rand1WB$rich
rich1WB <- rich1WB[complete.cases(rich1WB)]
small1WB <- rand1WB$small
rnets1WB <- rand1WB$rand

sw1WB<- vector("list", length = length(thres1))
    for (i in seq_along(thres1)){ sw1WB[[i]] <- small1WB[threshold == i] }


### DENSITY ### -------------------------------------------------------------------------------

# AUD -----------------------------------------------------------------------------------------

rand2AUD <- read_rds(paste0(savedir1, 'rand2AUD.RDS'))

rich2AUD <- rand2AUD$rich
rich2AUD <- rich2AUD[complete.cases(rich2AUD)]
small2AUD <- rand2AUD$small
rnets2AUD <- rand2AUD$rand

sw2AUD <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2AUD[[i]] <- small2AUD[threshold == i] }


# CON -----------------------------------------------------------------------------------------

rand2CON <- read_rds(paste0(savedir1, 'rand2CON.RDS'))

rich2CON <- rand2CON$rich
rich2CON <- rich2CON[complete.cases(rich2CON)]
small2CON <- rand2CON$small
rnets2CON <- rand2CON$rand

sw2CON <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2CON[[i]] <- small2CON[threshold == i] }


# DAN -----------------------------------------------------------------------------------------

rand2DAN <- read_rds(paste0(savedir1, 'rand2DAN.RDS'))

rich2DAN <- rand2DAN$rich
rich2DAN <- rich2DAN[complete.cases(rich2DAN)]
small2DAN <- rand2DAN$small
rnets2DAN <- rand2DAN$rand

sw2DAN <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2DAN[[i]] <- small2DAN[threshold == i] }


# DMN -----------------------------------------------------------------------------------------

rand2DMN <- read_rds(paste0(savedir1, 'rand2DMN.RDS'))

rich2DMN <- rand2DMN$rich
rich2DMN <- rich2DMN[complete.cases(rich2DMN)]
small2DMN <- rand2DMN$small
rnets2DMN <- rand2DMN$rand

sw2DMN <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2DMN[[i]] <- small2DMN[threshold == i] }


# FPN -----------------------------------------------------------------------------------------

rand2FPN <- read_rds(paste0(savedir1, 'rand2FPN.RDS'))

rich2FPN <- rand2FPN$rich
rich2FPN <- rich2FPN[complete.cases(rich2FPN)]
small2FPN <- rand2FPN$small
rnets2FPN <- rand2FPN$rand

sw2FPN <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2FPN[[i]] <- small2FPN[threshold == i] }


# SAL -----------------------------------------------------------------------------------------

rand2SAL <- read_rds(paste0(savedir1, 'rand2SAL.RDS'))

rich2SAL <- rand2SAL$rich
rich2SAL <- rich2SAL[complete.cases(rich2SAL)]
small2SAL <- rand2SAL$small
rnets2SAL <- rand2SAL$rand

sw2SAL <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2SAL[[i]] <- small2SAL[threshold == i] }


# SMH -----------------------------------------------------------------------------------------

rand2SMH <- read_rds(paste0(savedir1, 'rand2SMH.RDS'))

rich2SMH <- rand2SMH$rich
rich2SMH <- rich2SMH[complete.cases(rich2SMH)]
small2SMH <- rand2SMH$small
rnets2SMH <- rand2SMH$rand

sw2SMH <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2SMH[[i]] <- small2SMH[threshold == i] }


# SMM -----------------------------------------------------------------------------------------

rand2SMM <- read_rds(paste0(savedir1, 'rand2SMM.RDS'))

rich2SMM <- rand2SMM$rich
rich2SMM <- rich2SMM[complete.cases(rich2SMM)]
small2SMM <- rand2SMM$small
rnets2SMM <- rand2SMM$rand

sw2SMM <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2SMM[[i]] <- small2SMM[threshold == i] }


# SUB -----------------------------------------------------------------------------------------

rand2SUB <- read_rds(paste0(savedir1, 'rand2SUB.RDS'))

rich2SUB <- rand2SUB$rich
rich2SUB <- rich2SUB[complete.cases(rich2SUB)]
small2SUB <- rand2SUB$small
rnets2SUB <- rand2SUB$rand

sw2SUB <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2SUB[[i]] <- small2SUB[threshold == i] }


# UNC -----------------------------------------------------------------------------------------

rand2UNC <- read_rds(paste0(savedir1, 'rand2UNC.RDS'))

rich2UNC <- rand2UNC$rich
rich2UNC <- rich2UNC[complete.cases(rich2UNC)]
small2UNC <- rand2UNC$small
rnets2UNC <- rand2UNC$rand

sw2UNC <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2UNC[[i]] <- small2UNC[threshold == i] }


# VIS -----------------------------------------------------------------------------------------

rand2VIS <- read_rds(paste0(savedir1, 'rand2VIS.RDS'))

rich2VIS <- rand2VIS$rich
rich2VIS <- rich2VIS[complete.cases(rich2VIS)]
small2VIS <- rand2VIS$small
rnets2VIS <- rand2VIS$rand

sw2VIS <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2VIS[[i]] <- small2VIS[threshold == i] }


# Whole brain ---------------------------------------------------------------------------------

rand2WB <- read_rds(paste0(savedir1, 'rand2WB.RDS'))

rich2WB <- rand2WB$rich
rich2WB <- rich2WB[complete.cases(rich2WB)]
small2WB <- rand2WB$small
rnets2WB <- rand2WB$rand

sw2WB<- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw2WB[[i]] <- small2WB[threshold == i] }


### CONSISTENCY ### ---------------------------------------------------------------------------

# AUD -----------------------------------------------------------------------------------------

rand3AUD <- read_rds(paste0(savedir1, 'rand3AUD.RDS'))

rich3AUD <- rand3AUD$rich
rich3AUD <- rich3AUD[complete.cases(rich3AUD)]
small3AUD <- rand3AUD$small
rnets3AUD <- rand3AUD$rand

sw3AUD <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3AUD[[i]] <- small3AUD[threshold == i] }


# CON -----------------------------------------------------------------------------------------

rand3CON <- read_rds(paste0(savedir1, 'rand3CON.RDS'))

rich3CON <- rand3CON$rich
rich3CON <- rich3CON[complete.cases(rich3CON)]
small3CON <- rand3CON$small
rnets3CON <- rand3CON$rand

sw3CON <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3CON[[i]] <- small3CON[threshold == i] }


# DAN -----------------------------------------------------------------------------------------

rand3DAN <- read_rds(paste0(savedir1, 'rand3DAN.RDS'))

rich3DAN <- rand3DAN$rich
rich3DAN <- rich3DAN[complete.cases(rich3DAN)]
small3DAN <- rand3DAN$small
rnets3DAN <- rand3DAN$rand

sw3DAN <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3DAN[[i]] <- small3DAN[threshold == i] }


# DMN -----------------------------------------------------------------------------------------

rand3DMN <- read_rds(paste0(savedir1, 'rand3DMN.RDS'))

rich3DMN <- rand3DMN$rich
rich3DMN <- rich3DMN[complete.cases(rich3DMN)]
small3DMN <- rand3DMN$small
rnets3DMN <- rand3DMN$rand

sw3DMN <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3DMN[[i]] <- small3DMN[threshold == i] }


# FPN -----------------------------------------------------------------------------------------

rand3FPN <- read_rds(paste0(savedir1, 'rand3FPN.RDS'))

rich3FPN <- rand3FPN$rich
rich3FPN <- rich3FPN[complete.cases(rich3FPN)]
small3FPN <- rand3FPN$small
rnets3FPN <- rand3FPN$rand

sw3FPN <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3FPN[[i]] <- small3FPN[threshold == i] }


# SAL -----------------------------------------------------------------------------------------

rand3SAL <- read_rds(paste0(savedir1, 'rand3SAL.RDS'))

rich3SAL <- rand3SAL$rich
rich3SAL <- rich3SAL[complete.cases(rich3SAL)]
small3SAL <- rand3SAL$small
rnets3SAL <- rand3SAL$rand

sw3SAL <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3SAL[[i]] <- small3SAL[threshold == i] }


# SMH -----------------------------------------------------------------------------------------

rand3SMH <- read_rds(paste0(savedir1, 'rand3SMH.RDS'))

rich3SMH <- rand3SMH$rich
rich3SMH <- rich3SMH[complete.cases(rich3SMH)]
small3SMH <- rand3SMH$small
rnets3SMH <- rand3SMH$rand

sw3SMH <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3SMH[[i]] <- small3SMH[threshold == i] }


# SMM -----------------------------------------------------------------------------------------

rand3SMM <- read_rds(paste0(savedir1, 'rand3SMM.RDS'))

rich3SMM <- rand3SMM$rich
rich3SMM <- rich3SMM[complete.cases(rich3SMM)]
small3SMM <- rand3SMM$small
rnets3SMM <- rand3SMM$rand

sw3SMM <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3SMM[[i]] <- small3SMM[threshold == i] }


# SUB -----------------------------------------------------------------------------------------

rand3SUB <- read_rds(paste0(savedir1, 'rand3SUB.RDS'))

rich3SUB <- rand3SUB$rich
rich3SUB <- rich3SUB[complete.cases(rich3SUB)]
small3SUB <- rand3SUB$small
rnets3SUB <- rand3SUB$rand

sw3SUB <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3SUB[[i]] <- small3SUB[threshold == i] }


# UNC -----------------------------------------------------------------------------------------

rand3UNC <- read_rds(paste0(savedir1, 'rand3UNC.RDS'))

rich3UNC <- rand3UNC$rich
rich3UNC <- rich3UNC[complete.cases(rich3UNC)]
small3UNC <- rand3UNC$small
rnets3UNC <- rand3UNC$rand

sw3UNC <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3UNC[[i]] <- small3UNC[threshold == i] }


# VIS -----------------------------------------------------------------------------------------

rand3VIS <- read_rds(paste0(savedir1, 'rand3VIS.RDS'))

rich3VIS <- rand3VIS$rich
rich3VIS <- rich3VIS[complete.cases(rich3VIS)]
small3VIS <- rand3VIS$small
rnets3VIS <- rand3VIS$rand

sw3VIS <- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3VIS[[i]] <- small3VIS[threshold == i] }


# Whole brain ---------------------------------------------------------------------------------

rand3WB <- read_rds(paste0(savedir1, 'rand3WB.RDS'))

rich3WB <- rand3WB$rich
rich3WB <- rich3WB[complete.cases(rich3WB)]
small3WB <- rand3WB$small
rnets3WB <- rand3WB$rand

sw3WB<- vector("list", length = length(thresh2))
for (i in seq_along(thresh2)){ sw3WB[[i]] <- small3WB[threshold == i] }

