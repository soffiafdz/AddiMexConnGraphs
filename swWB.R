
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "WB"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1WB <- analysis_random_graphs(g1WB, kNumRand, savedir = outdir1, clustering = clustering)
rand2WB <- analysis_random_graphs(g2WB, kNumRand, savedir = outdir2, clustering = clustering)
rand3WB <- analysis_random_graphs(g3WB, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1WB, paste0(savedir1, 'rand1WB.RDS'))
write_rds(rand2WB, paste0(savedir1, 'rand2WB.RDS'))
write_rds(rand3WB, paste0(savedir1, 'rand3WB.RDS'))

