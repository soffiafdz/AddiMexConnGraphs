
# Set up - dataframe Consensus -----------------------------------------------------------------

attr1WB <- vector('list', length=length(thresh1))

for (i in seq_along(thresh1)){
   attr1WB[[i]] <- rbindlist(list(graph_attr_dt(g1WB[[1]][[i]]),
                                  graph_attr_dt(g1WB[[2]][[i]])))
    attr1WB[[i]] <- select(attr1WB[[i]], 22, 26, 23, 16, 2, 1, 3, 20, 4:15, 19, 21) %>% data.table()
    names(attr1WB[[i]])[3] <- "Network"
    attr1WB[[i]]$Network <- str_replace_all(attr1WB[[i]]$Network, "p", "")
    attr1WB[[i]] <- data.table(attr1WB[[i]][!duplicated(attr1WB[[i]]), ])
}

write_rds(attr1WB, "whole_brain_conn_consensus.rds")

# Set up - dataframe Density ------------------------------------------------------------------

attr2WB <- vector('list', length=length(thresh2))

for (i in seq_along(thresh2)){
    attr2WB[[i]] <- rbindlist(list(graph_attr_dt(g2WB[[1]][[i]]),
                                   graph_attr_dt(g2WB[[2]][[i]])))
    attr2WB[[i]] <- select(attr2WB[[i]], 22, 26, 23, 16, 2, 1, 3, 20, 4:15, 19, 21) %>% data.table()
    names(attr2WB[[i]])[3] <- "Network"
    attr2WB[[i]]$Network <- str_replace_all(attr2WB[[i]]$Network, "p", "")
    attr2WB[[i]] <- data.table(attr2WB[[i]][!duplicated(attr2WB[[i]]), ])
}

write_rds(attr2WB, "whole_brain_conn_density.rds")


# Set up - dataframe Consistency --------------------------------------------------------------

attr3WB <- vector('list', length=length(thresh2))

for (i in seq_along(thresh2)){
    attr3WB[[i]] <- rbindlist(list(graph_attr_dt(g3WB[[1]][[i]]),
                                   graph_attr_dt(g3WB[[2]][[i]])))
    attr3WB[[i]] <- select(attr3WB[[i]], 22, 26, 23, 16, 2, 1, 3, 20, 4:15, 19, 21) %>% data.table()
    names(attr3WB[[i]])[3] <- "Network"
    attr3WB[[i]]$Network <- str_replace_all(attr3WB[[i]]$Network, "p", "")
    attr3WB[[i]] <- data.table(attr3WB[[i]][!duplicated(attr3WB[[i]]), ])
}

write_rds(attr3WB, "whole_brain_conn_consistency.rds")
