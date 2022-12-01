library(flextable)

file_path_data <-
  "/Users/woutervanrossem/PhD/Writings/2020_Ontology-analysis/analysis/data/"

node_type <- "code-group"
filter_nodes <- c("System native", "System pre-existant", "linking data")
columns <-
  c(
    "node_name",
    "node_centrality_closeness",
    "node_centrality_betweenness",
    "node_centrality_degree"
  )

eu <-
  read.csv(
    file = paste(file_path_data, "eurodac_sis_vis.csv", sep = ""),
    head = TRUE,
    sep = ","
  )
eu <- eu[eu$node_type == node_type,]
eu['source'] = 'eu'
eu <- eu[, columns]

xka <-
  read.csv(
    file = paste(file_path_data, "xka.csv", sep = ""),
    head = TRUE,
    sep = ","
  )
xka <- xka[xka$node_type == node_type,]
xka['source'] = 'xka'
xka <- xka[, columns]

xauslander <-
  read.csv(
    file = paste(file_path_data, "german_xauslander.csv", sep = ""),
    head = TRUE,
    sep = ","
  )
xauslander <- xauslander[xauslander$node_type == node_type,]
xauslander['source'] = 'xauslander'
xauslander <- xauslander[, columns]

# combined <- merge(eu, xka, sort = TRUE)
# combined <- merge(combined, xauslander, sort = TRUE)
combined <- rbind(eu, xka, xauslander)
combined <- unique(combined[ , 1:4 ])
combined <- combined[!(combined$node_name %in% filter_nodes), ]
combined <-
  combined[order(
    combined$node_centrality_betweenness,
    decreasing = TRUE
  ),]
# combined <-
#   combined[order(
#     combined$node_centrality_betweenness,
#     combined$node_centrality_closeness,
#     decreasing = TRUE
#   ),]

ft <- flextable(
  combined,
  col_keys = c(
    "node_name",
    "node_centrality_degree",
    # "node_centrality_closeness",
    "node_centrality_betweenness"
  )
)
ft <- bold(ft, part = "header")
ft <-
  set_header_labels(
    ft,
    node_name = "Code group",
    node_centrality_degree = "Degree centrality",
    # node_centrality_closeness = "Closeness",
    node_centrality_betweenness = "Betweenness centrality"
  )
ft <- theme_box(ft)

ft <- compose(ft,
              j = 2,
              value = as_paragraph(linerange(
                value = node_centrality_degree, max = max(node_centrality_degree)
              )),
              part = "body")

ft <- compose(ft,
              j = 3,
              value = as_paragraph(linerange(
                value = node_centrality_betweenness, max = max(node_centrality_betweenness)
              )),
              part = "body")

ft <- autofit(ft)
