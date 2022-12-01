file_path_data <- "/Users/woutervanrossem/PhD/Writings/2020_Ontology-analysis/analysis/data/"

diff_eurodac <- read.csv(file=paste(file_path_data, "eurodac_particular.csv"),head=TRUE,sep=",")
diff_eurodac <- diff_eurodac[diff_eurodac$node_type == "code-group",]
diff_eurodac <- diff_eurodac$node_name

diff_sis <- read.csv(file=paste(file_path_data, "sis_particular.csv"),head=TRUE,sep=",")
diff_sis <- diff_sis[diff_sis$node_type == "code-group",]
diff_sis <- diff_sis$node_name

diff_vis <- read.csv(file=paste(file_path_data, "vis_particular.csv"),head=TRUE,sep=",")
diff_vis <- diff_vis[diff_vis$node_type == "code-group",]
diff_vis <- diff_vis$node_name

max.len = max(length(diff_eurodac), length(diff_sis), length(diff_vis))
combined <- data.frame(
  eurodac=c(diff_eurodac, rep("", max.len - length(diff_eurodac))),
  sis=c(diff_sis, rep("", max.len - length(diff_sis))),
  vis=c(diff_vis, rep("", max.len - length(diff_vis))))
ft <- flextable(
  combined,
  col_keys = c("eurodac", "sis", "vis"))
ft <- autofit(ft)
ft <- bold(ft, part = "header")
ft <- set_header_labels(ft, eurodac = "Eurodac",
    sis = "Schengen Information System", vis = "Visa Information System")
ft
