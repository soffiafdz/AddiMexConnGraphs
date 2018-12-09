
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "VAN"
outdir <- paste0(savedir, "/rand", today, net)


# Analysis random nets ------------------------------------------------------------------------

randVAN <- analysis_random_graphs(gVAN, kNumRand, savedir = outdir, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(randVAN, paste0(savedir1, 'randVAN.RDS'))

