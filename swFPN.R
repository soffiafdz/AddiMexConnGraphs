
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "FPN"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1FPN <- analysis_random_graphs(g1FPN, kNumRand, savedir = outdir1, clustering = clustering)
rand2FPN <- analysis_random_graphs(g2FPN, kNumRand, savedir = outdir2, clustering = clustering)
rand3FPN <- analysis_random_graphs(g3FPN, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1FPN, paste0(savedir1, 'rand1FPN.RDS'))
write_rds(rand2FPN, paste0(savedir1, 'rand2FPN.RDS'))
write_rds(rand3FPN, paste0(savedir1, 'rand3FPN.RDS'))

