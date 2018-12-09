
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "DAN"
outdir <- paste0(savedir, "/rand", today, net)


# Analysis random nets ------------------------------------------------------------------------

randDAN <- analysis_random_graphs(gDAN, kNumRand, savedir = outdir, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(randDAN, paste0(savedir1, 'randDAN.RDS'))
