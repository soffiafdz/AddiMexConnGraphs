
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "VAN"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1VAN <- analysis_random_graphs(g1VAN, kNumRand, savedir = outdir1, clustering = clustering)
rand2VAN <- analysis_random_graphs(g2VAN, kNumRand, savedir = outdir2, clustering = clustering)
rand3VAN <- analysis_random_graphs(g3VAN, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1VAN, paste0(savedir1, 'rand1VAN.RDS'))
write_rds(rand2VAN, paste0(savedir1, 'rand2VAN.RDS'))
write_rds(rand3VAN, paste0(savedir1, 'rand3VAN.RDS'))

