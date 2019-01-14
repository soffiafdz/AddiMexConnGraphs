
# Consensus -----------------------------------------------------------------------------------

A.norm.sub <- matsSMH1$A.norm.sub
A.norm.mean <- matsSMH1$A.norm.mean
atlas <- "pSMH"
g1GrSMH <- g1SMH <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh1)) {
        print(paste0('Threshold ', j, '/', length(thresh1), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pSMH$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresh1[j], 
                                             subject = covars[groups[i], Study.ID[k]], 
                                             group = groups[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, 
                                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g1GrSMH[[i]] <- lapply(seq_along(thresh1), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh1)) {V(g1GrSMH[[i]][[x]])$name <- as.character(pSMH$name)}
    
    g1GrSMH[[i]] <- llply(seq_along(thresh1), function(x) 
        set_brainGraph_attr_sof(g1GrSMH[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh1[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g1SMH[[i]] <- fnames[[i]] <- vector('list', length = length(thresh1))
    for (j in seq_along(thresh1)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g1SMH[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g1SMH[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g1SMH, paste0(savedir1, 'g1SMH.rds'))
write_rds(g1GrSMH, paste0(savedir1, 'g1GrSMH.rds'))


# Density -------------------------------------------------------------------------------------

A.norm.sub <- matsSMH2$A.norm.sub
A.norm.mean <- matsSMH2$A.norm.mean
atlas <- "pSMH"
g2GrSMH <- g2SMH <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh2)) {
        print(paste0('Threshold ', j, '/', length(thresh2), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pSMH$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresh2[j], 
                                             subject = covars[groups[i], Study.ID[k]], 
                                             group = groups[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, 
                                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g2GrSMH[[i]] <- lapply(seq_along(thresh2), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh2)) {V(g2GrSMH[[i]][[x]])$name <- as.character(pSMH$name)}
    
    g2GrSMH[[i]] <- llply(seq_along(thresh2), function(x) 
        set_brainGraph_attr_sof(g2GrSMH[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh2[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g2SMH[[i]] <- fnames[[i]] <- vector('list', length = length(thresh2))
    for (j in seq_along(thresh2)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2SMH[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g2SMH[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g2SMH, paste0(savedir1, 'g2SMH.rds'))
write_rds(g2GrSMH, paste0(savedir1, 'g2GrSMH.rds'))


# Consistency ---------------------------------------------------------------------------------

A.norm.sub <- matsSMH3$A.norm.sub
A.norm.mean <- matsSMH3$A.norm.mean
atlas <- "pSMH"
g3GrSMH <- g3SMH <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh2)) {
        print(paste0('Threshold ', j, '/', length(thresh2), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pSMH$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresh2[j], 
                                             subject = covars[groups[i], Study.ID[k]], 
                                             group = groups[i], 
                                             use.parallel = F, 
                                             A = A.norm.sub[[j]][, , inds[[i]][k]])
            write_rds(g.tmp, paste0(savedir1, 
                                    sprintf('g%i_thr%02i_subj%03i%s', i, j, k, '.rds')))
        }
    }
    
    # group mean weighted graphs
    print(paste0('Group', i, '; ', format(Sys.time(), '%H:%M:%S')))
    g3GrSMH[[i]] <- lapply(seq_along(thresh2), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh2)) {V(g3GrSMH[[i]][[x]])$name <- as.character(pSMH$name)}
    
    g3GrSMH[[i]] <- llply(seq_along(thresh2), function(x) 
        set_brainGraph_attr_sof(g3GrSMH[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh2[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g3SMH[[i]] <- fnames[[i]] <- vector('list', length = length(thresh2))
    for (j in seq_along(thresh2)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g3SMH[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g3SMH[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g3SMH, paste0(savedir1, 'g3SMH.rds'))
write_rds(g3GrSMH, paste0(savedir1, 'g3GrSMH.rds'))
