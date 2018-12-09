
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "MEM"
outdir <- paste0(savedir, "/rand", today, net)


# Analysis random nets ------------------------------------------------------------------------

randMEM <- analysis_random_graphs(gMEM, kNumRand, savedir = outdir, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(randMEM, paste0(savedir1, 'randMEM.RDS'))

