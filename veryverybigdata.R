conn <- rbindlist(c(lapply(gWB[[1]][[3]], vertex_attr_dt_sof), 
                    lapply(gWB[[2]][[3]], vertex_attr_dt_sof))) %>% 
    select(32, 37, 2:31) %>% 
    gather("Metric", "Value", 6:32) %>% 
    mutate(Node = paste(region, hemi, lobe, Metric, sep = "_")) %>% 
    select(-region, -hemi, -lobe, -Metric) %>% 
    spread(Node, Value)
    
    
saveRDS(conn, "veryVeryBIGdata.RDS")
    

