
# Set up --------------------------------------------------------------------------------------

kNumRand <- 1e2
clustering <- F
net <- "SUB"
outdir1 <- paste0(savedir, "/rand1_", today, net)
outdir2 <- paste0(savedir, "/rand2_", today, net)
outdir3 <- paste0(savedir, "/rand3_", today, net)


# Analysis random nets ------------------------------------------------------------------------

rand1SUB <- analysis_random_graphs(g1SUB, kNumRand, savedir = outdir1, clustering = clustering)
rand2SUB <- analysis_random_graphs(g2SUB, kNumRand, savedir = outdir2, clustering = clustering)
rand3SUB <- analysis_random_graphs(g3SUB, kNumRand, savedir = outdir3, clustering = clustering)


# Saving RDS random nets  ---------------------------------------------------------------------

write_rds(rand1SUB, paste0(savedir1, 'rand1SUB.RDS'))
write_rds(rand2SUB, paste0(savedir1, 'rand2SUB.RDS'))
write_rds(rand3SUB, paste0(savedir1, 'rand3SUB.RDS'))

