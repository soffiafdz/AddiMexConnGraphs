
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "UNC"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1UNC <- analysis_random_graphs(g1UNC, kNumRand, savedir = outdir1, clustering = clustering)
rand2UNC <- analysis_random_graphs(g2UNC, kNumRand, savedir = outdir2, clustering = clustering)
rand3UNC <- analysis_random_graphs(g3UNC, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1UNC, paste0(savedir1, 'rand1UNC.RDS'))
write_rds(rand2UNC, paste0(savedir1, 'rand2UNC.RDS'))
write_rds(rand3UNC, paste0(savedir1, 'rand3UNC.RDS'))

