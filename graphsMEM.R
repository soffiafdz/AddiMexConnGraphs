
# Consensus -----------------------------------------------------------------------------------

A.norm.sub <- matsMEM1$A.norm.sub
A.norm.mean <- matsMEM1$A.norm.mean
atlas <- "pMEM"
g1GrMEM <- g1MEM <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh1[-11])) {
        print(paste0('Threshold ', j, '/', length(thresh1[-11]), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pMEM$name)
            
            g.tmp <- set_brainGraph_attr_sof(g.tmp, atlas, modality = 'fmri',
                                             weighting = 'sld', threshold = thresh1[-11][j], 
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
    g1GrMEM[[i]] <- lapply(seq_along(thresh1[-11]), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh1[-11])) {V(g1GrMEM[[i]][[x]])$name <- as.character(pMEM$name)}
    
    g1GrMEM[[i]] <- llply(seq_along(thresh1[-11]), function(x) 
        set_brainGraph_attr_sof(g1GrMEM[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh1[-11][x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g1MEM[[i]] <- fnames[[i]] <- vector('list', length = length(thresh1[-11]))
    for (j in seq_along(thresh1[-11])) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g1MEM[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g1MEM[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g1MEM, paste0(savedir1, 'g1MEM.rds'))
write_rds(g1GrMEM, paste0(savedir1, 'g1GrMEM.rds'))


# Density -------------------------------------------------------------------------------------

A.norm.sub <- matsMEM2$A.norm.sub
A.norm.mean <- matsMEM2$A.norm.mean
atlas <- "pMEM"
g2GrMEM <- g2MEM <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh2)) {
        print(paste0('Threshold ', j, '/', length(thresh2), '; group ', i, '; ',
                     format(Sys.time(), '%H:%M:%S')))

        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pMEM$name)

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
    g2GrMEM[[i]] <- lapply(seq_along(thresh2), function(x)
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]],
                                    mode = 'undirected', diag = F, weighted = T))

    for (x in seq_along(thresh2)) {V(g2GrMEM[[i]][[x]])$name <- as.character(pMEM$name)}

    g2GrMEM[[i]] <- llply(seq_along(thresh2), function(x)
        set_brainGraph_attr_sof(g2GrMEM[[i]][[x]], atlas, modality = 'fmri',
                                weighting = 'sld', threshold = thresh2[x],
                                group = groups[i], A = A.norm.mean[[x]][[i]],
                                use.parallel = F), .parallel = T)

}

for (i in seq_along(groups)) {
    g2MEM[[i]] <- fnames[[i]] <- vector('list', length = length(thresh2))
    for (j in seq_along(thresh2)) {
        fnames[[i]][[j]] <- list.files(savedir,
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g2MEM[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }

    x <- all.equal(sapply(g2MEM[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g2MEM, paste0(savedir1, 'g2MEM.rds'))
write_rds(g2GrMEM, paste0(savedir1, 'g2GrMEM.rds'))


# Consistency ---------------------------------------------------------------------------------

A.norm.sub <- matsMEM3$A.norm.sub
A.norm.mean <- matsMEM3$A.norm.mean
atlas <- "pMEM"
g3GrMEM <- g3MEM <- fnames <- vector('list', length=length(groups))

for (i in seq_along(groups)) {
    for (j in seq_along(thresh2)) {
        print(paste0('Threshold ', j, '/', length(thresh2), '; group ', i, '; ', 
                     format(Sys.time(), '%H:%M:%S')))
        
        foreach (k=seq_along(inds[[i]])) %dopar% {
            g.tmp <- graph_from_adjacency_matrix(A.norm.sub[[j]][, , inds[[i]][k]],
                                                 mode='undirected', diag = F, weighted = T)
            V(g.tmp)$name <- as.character(pMEM$name)
            
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
    g3GrMEM[[i]] <- lapply(seq_along(thresh2), function(x) 
        graph_from_adjacency_matrix(A.norm.mean[[x]][[i]], 
                                    mode = 'undirected', diag = F, weighted = T))
    
    for (x in seq_along(thresh2)) {V(g3GrMEM[[i]][[x]])$name <- as.character(pMEM$name)}
    
    g3GrMEM[[i]] <- llply(seq_along(thresh2), function(x) 
        set_brainGraph_attr_sof(g3GrMEM[[i]][[x]], atlas, modality = 'fmri', 
                                weighting = 'sld', threshold = thresh2[x], 
                                group = groups[i], A = A.norm.mean[[x]][[i]], 
                                use.parallel = F), .parallel = T)
    
}

for (i in seq_along(groups)) {
    g3MEM[[i]] <- fnames[[i]] <- vector('list', length = length(thresh2))
    for (j in seq_along(thresh2)) {
        fnames[[i]][[j]] <- list.files(savedir, 
                                       sprintf('*g%i_thr%02i.*', i, j), full.names = T)
        g3MEM[[i]][[j]] <- lapply(fnames[[i]][[j]], read_rds)
    }
    
    x <- all.equal(sapply(g3MEM[[i]][[1]], graph_attr, 'name'),
                   covars[groups[i], Study.ID])
    if (isTRUE(x)) lapply(fnames[[i]], file.remove)
}


write_rds(g3MEM, paste0(savedir1, 'g3MEM.rds'))
write_rds(g3GrMEM, paste0(savedir1, 'g3GrMEM.rds'))
