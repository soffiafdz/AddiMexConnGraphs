
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "MEM"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1MEM <- analysis_random_graphs(g1MEM, kNumRand, savedir = outdir1, clustering = clustering)
rand2MEM <- analysis_random_graphs(g2MEM, kNumRand, savedir = outdir2, clustering = clustering)
rand3MEM <- analysis_random_graphs(g3MEM, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1MEM, paste0(savedir1, 'rand1MEM.RDS'))
write_rds(rand2MEM, paste0(savedir1, 'rand2MEM.RDS'))
write_rds(rand3MEM, paste0(savedir1, 'rand3MEM.RDS'))

