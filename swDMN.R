
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "DMN"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1DMN <- analysis_random_graphs(g1DMN, kNumRand, savedir = outdir1, clustering = clustering)
rand2DMN <- analysis_random_graphs(g2DMN, kNumRand, savedir = outdir2, clustering = clustering)
rand3DMN <- analysis_random_graphs(g3DMN, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1DMN, paste0(savedir1, 'rand1DMN.RDS'))
write_rds(rand2DMN, paste0(savedir1, 'rand2DMN.RDS'))
write_rds(rand3DMN, paste0(savedir1, 'rand3DMN.RDS'))

