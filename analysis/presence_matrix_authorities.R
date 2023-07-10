library(flextable)

file_path_data <-
  "./analysis/data/"

node_type <- "code-group"
filter_nodes <-
  c("System native",
    "System pre-existant",
    "linking data",
    "education: extent: values",
    "religion: values",
    "travel document type: values",
    "civil status: values")

eu <-
  read.csv(
    file = paste(file_path_data, "eurodac_sis_vis.csv", sep = ""),
    head = TRUE,
    sep = ","
  )
eu <- eu[eu$node_type == node_type, ]
eu['source'] = 'eu'
eu_c <- eu[, c("node_name", "source")]

xka <-
  read.csv(
    file = paste(file_path_data, "xka.csv", sep = ""),
    head = TRUE,
    sep = ","
  )
xka <- xka[xka$node_type == node_type, ]
xka['source'] = 'xka'
xka_c <- xka[, c("node_name", "source")]

xauslander <-
  read.csv(
    file = paste(file_path_data, "german_xauslander.csv", sep = ""),
    head = TRUE,
    sep = ","
  )
xauslander <- xauslander[xauslander$node_type == node_type, ]
xauslander['source'] = 'xauslander'
xauslander_c <- xauslander[, c("node_name", "source")]

bc <-
  read.csv(
    file = paste(file_path_data, "eu_xka_xauslander.csv", sep = ""),
    head = TRUE,
    sep = ","
  )
bc <- bc[bc$node_type == node_type, ]

frequencies <- bc
frequencies <- unique(frequencies[, 1:6])
frequencies <-
  frequencies[!(frequencies$node_name %in% filter_nodes),]

combined <- rbind(eu_c, xka_c, xauslander_c)

combined <- unique(combined[, 1:2])
combined <- combined[!(combined$node_name %in% filter_nodes), ]
matrix <- as.data.frame.matrix(table(combined))

summed <- rowSums(matrix[, c(1, 2, 3)])

combined <- data.frame(
  name = row.names(matrix),
  eu = matrix$eu,
  xka = matrix$xka,
  xauslander = matrix$xauslander,
  # names=frequencies$node_name,
  # degree=frequencies$node_centrality_degree,
  # betweenness=frequencies$node_centrality_betweenness,
  summed = summed
)

combined <-
  merge(combined, frequencies, by.x = "name", by.y = "node_name")

order.amount <- order(combined$summed, decreasing = TRUE)
combined <- combined[order.amount, ]

combined <- combined[match(unique(combined$name),combined$name),]

combined <- as_grouped_data(x = combined, groups = c("summed"))

ft <- flextable(
  combined,
  col_keys = c(
    "summed",
    "name",
    "eu",
    "xka",
    "xauslander",
    # "node_centrality_degree",
    "node_centrality_betweenness"
  )
)
ft <- autofit(ft)
ft <- bold(ft, part = "header")
ft <-
  set_header_labels(
    ft,
    summed = "Degree",
    name = "Code group",
    eu = "EU",
    xka = "Greek",
    xauslander = "German",
    # node_centrality_degree = "Degree",
    node_centrality_betweenness = "Betweenness"
  )

color_presence <- "#7d90ae"
color_absence <- "white"

ft <- theme_box(ft)

ft <- bg(ft, ~ eu == 1, j = ~ eu, bg = color_presence)
ft <- color(ft, ~ eu == 1, j = ~ eu, color = color_presence)
ft <- bg(ft, ~ eu == 0, j = ~ eu, bg = color_absence)
ft <- color(ft, ~ eu == 0, j = ~ eu, color = color_absence)
ft <- bg(ft, ~ xka == 1, j = ~ xka, bg = color_presence)
ft <- color(ft, ~ xka == 1, j = ~ xka, color = color_presence)
ft <- bg(ft, ~ xka == 0, j = ~ xka, bg = color_absence)
ft <- color(ft, ~ xka == 0, j = ~ xka, color = color_absence)
ft <-
  bg(ft, ~ xauslander == 1, j = ~ xauslander, bg = color_presence)
ft <-
  color(ft, ~ xauslander == 1, j = ~ xauslander, color = color_presence)
ft <-
  bg(ft, ~ xauslander == 0, j = ~ xauslander, bg = color_absence)
ft <-
  color(ft, ~ xauslander == 0, j = ~ xauslander, color = color_absence)

ft <- compose(ft,
    i = ~ !is.na(summed), j = 3:6,
    value = as_paragraph("")
  )

ft <- compose(ft, 
    i = ~ is.na(summed),
    j = 1,
    value = as_paragraph("")
  )

ft <- merge_h(ft)

ft <- compose(
  ft,
  i = ~ !is.na(summed),
  j = "summed",
  value = as_paragraph(as_chunk(
    summed,
    formatter = function(x)
      sprintf("%.0f", x)
  ))
)

ft <- colformat_num(
    ft,
    j = "node_centrality_betweenness",
    big.mark = " ", decimal.mark = ",",
    na_str = "na"
  )

# ft <- compose(
#   ft,
#   i = ~ is.na(summed),
#   j = "node_centrality_degree",
#   value = as_paragraph(linerange(
#     value = node_centrality_degree, max = max(node_centrality_degree)
#   )),
#   part = "body"
# )

ft <- compose(
  ft,
  i = ~ is.na(summed),
  j = "node_centrality_betweenness",
  value = as_paragraph(linerange(
    value = node_centrality_betweenness,
    max = max(node_centrality_betweenness)
  )),
  part = "body"
)

ft <- autofit(ft)
