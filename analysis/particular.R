file_path_data <- "/Users/woutervanrossem/PhD/Writings/2020_Ontology-analysis/analysis/data/"

diff_gr_eu <- read.csv(file = paste(file_path_data, "greek_diff_eu.csv", sep = ""),head=TRUE,sep=",")
diff_gr_eu <- diff_gr_eu[diff_gr_eu$node_type == "code-group",]
diff_gr_eu <- diff_gr_eu$node_name

diff_de_eu <- read.csv(file = paste(file_path_data, "german_diff_eu.csv", sep = ""),head=TRUE,sep=",")
diff_de_eu <- diff_de_eu[diff_de_eu$node_type == "code-group",]
diff_de_eu <- diff_de_eu$node_name

diff_gr_eu <- data.frame(diff_gr_eu)
diff_de_eu <- data.frame(diff_de_eu)

ft <- flextable(diff_gr_eu)
ft <- autofit(ft)
ft <- bold(ft, part = "header")
ft <- set_header_labels(ft, diff_gr_eu = "XKA code group names")
ft <- set_caption(ft, caption = "Code groups that are particular to the Greek systems, compared to the EU SIS, VIS, Eurodac")
ft

ft <- flextable(diff_de_eu)
ft <- autofit(ft)
ft <- bold(ft, part = "header")
ft <- set_header_labels(ft, diff_de_eu="XAuslander code group names")
ft <- set_caption(ft, caption = "Code groups that are particular to the Greek systems, compared to the EU SIS, VIS, Eurodac")
ft
