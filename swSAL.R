
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "SAL"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1SAL <- analysis_random_graphs(g1SAL, kNumRand, savedir = outdir1, clustering = clustering)
rand2SAL <- analysis_random_graphs(g2SAL, kNumRand, savedir = outdir2, clustering = clustering)
rand3SAL <- analysis_random_graphs(g3SAL, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1SAL, paste0(savedir1, 'rand1SAL.RDS'))
write_rds(rand2SAL, paste0(savedir1, 'rand2SAL.RDS'))
write_rds(rand3SAL, paste0(savedir1, 'rand3SAL.RDS'))

