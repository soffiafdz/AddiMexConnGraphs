
# Consensus -----------------------------------------------------------------------------------

A.norm.sub <- matsSMM1$A.norm.sub
A.norm.mean <- matsSMM1$A.norm.mean
atlas <- "pSMM"
g1GrSMM <- g1SMM <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh1)) {
        print(paste0('Threshold ', j, '/', length(thresh1), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pSMM$name)
            
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
    g1GrSMM[[i]] <- lapply(seq_along(thresh1), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh1)) {V(g1GrSMM[[i]][[x]])$name <- as.character(pSMM$name)}
    
    g1GrSMM[[i]] <- llply(seq_along(thresh1), function(x) 
        set_brainGraph_attr_sof(g1GrSMM[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh1[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g1SMM[[i]] <- fnames[[i]] <- vector('list', length = length(thresh1))
    for (j in seq_along(thresh1)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g1SMM[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g1SMM[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g1SMM, paste0(savedir1, 'g1SMM.rds'))
write_rds(g1GrSMM, paste0(savedir1, 'g1GrSMM.rds'))


# Density -------------------------------------------------------------------------------------

A.norm.sub <- matsSMM2$A.norm.sub
A.norm.mean <- matsSMM2$A.norm.mean
atlas <- "pSMM"
g2GrSMM <- g2SMM <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh2)) {
        print(paste0('Threshold ', j, '/', length(thresh2), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pSMM$name)
            
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
    g2GrSMM[[i]] <- lapply(seq_along(thresh2), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh2)) {V(g2GrSMM[[i]][[x]])$name <- as.character(pSMM$name)}
    
    g2GrSMM[[i]] <- llply(seq_along(thresh2), function(x) 
        set_brainGraph_attr_sof(g2GrSMM[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh2[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g2SMM[[i]] <- fnames[[i]] <- vector('list', length = length(thresh2))
    for (j in seq_along(thresh2)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2SMM[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g2SMM[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g2SMM, paste0(savedir1, 'g2SMM.rds'))
write_rds(g2GrSMM, paste0(savedir1, 'g2GrSMM.rds'))


# Consistency ---------------------------------------------------------------------------------

A.norm.sub <- matsSMM3$A.norm.sub
A.norm.mean <- matsSMM3$A.norm.mean
atlas <- "pSMM"
g3GrSMM <- g3SMM <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh2)) {
        print(paste0('Threshold ', j, '/', length(thresh2), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pSMM$name)
            
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
    g3GrSMM[[i]] <- lapply(seq_along(thresh2), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh2)) {V(g3GrSMM[[i]][[x]])$name <- as.character(pSMM$name)}
    
    g3GrSMM[[i]] <- llply(seq_along(thresh2), function(x) 
        set_brainGraph_attr_sof(g3GrSMM[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh2[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g3SMM[[i]] <- fnames[[i]] <- vector('list', length = length(thresh2))
    for (j in seq_along(thresh2)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g3SMM[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g3SMM[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g3SMM, paste0(savedir1, 'g3SMM.rds'))
write_rds(g3GrSMM, paste0(savedir1, 'g3GrSMM.rds'))
