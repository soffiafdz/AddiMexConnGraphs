
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "VIS"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1VIS <- analysis_random_graphs(g1VIS, kNumRand, savedir = outdir1, clustering = clustering)
rand2VIS <- analysis_random_graphs(g2VIS, kNumRand, savedir = outdir2, clustering = clustering)
rand3VIS <- analysis_random_graphs(g3VIS, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1VIS, paste0(savedir1, 'rand1VIS.RDS'))
write_rds(rand2VIS, paste0(savedir1, 'rand2VIS.RDS'))
write_rds(rand3VIS, paste0(savedir1, 'rand3VIS.RDS'))

