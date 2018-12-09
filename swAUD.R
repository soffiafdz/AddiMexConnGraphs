
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "AUD"
outdir <- paste0(savedir, "/rand", today, net)


# Analysis random nets ------------------------------------------------------------------------

randAUD <- analysis_random_graphs(gAUD, kNumRand, savedir = outdir, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(randAUD, paste0(savedir1, 'randAUD.RDS'))

