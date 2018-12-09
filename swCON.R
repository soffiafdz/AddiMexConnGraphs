
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "CON"
outdir <- paste0(savedir, "/rand", today, net)


# Analysis random nets ------------------------------------------------------------------------

randCON <- analysis_random_graphs(gCON, kNumRand, savedir = outdir, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(randCON, paste0(savedir1, 'randCON.RDS'))

