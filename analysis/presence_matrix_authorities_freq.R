library(DT)

library(flextable)

file_path_data <-
  "/Users/woutervanrossem/PhD/Writings/2020_Ontology-analysis/analysis/data/"
node_type <- "code-group"

filter_nodes <-
  c(
    "System native",
    "System pre-existant",
    "linking data",
    "civil status: values",
    "education: extent: values",
    "religion: values",
    "travel document type: values"
  )

eu <-
  read.csv(
    file = paste(file_path_data, "eurodac_sis_vis.csv", sep = ""),
    head = TRUE,
    sep = ","
  )
eu <- eu[eu$node_type == node_type,]
eu['source'] = 'eu'
eu <- eu[, c("node_name", "source")]

xka <-
  read.csv(
    file = paste(file_path_data, "xka.csv", sep = ""),
    head = TRUE,
    sep = ","
  )
xka <- xka[xka$node_type == node_type,]
xka['source'] = 'xka'
xka <- xka[, c("node_name", "source")]

xauslander <-
  read.csv(
    file = paste(file_path_data, "german_xauslander.csv", sep = ""),
    head = TRUE,
    sep = ","
  )
xauslander <- xauslander[xauslander$node_type == node_type,]
xauslander['source'] = 'xauslander'
xauslander <- xauslander[, c("node_name", "source")]

combined <- rbind(eu, xka, xauslander)

combined <- unique(combined[, 1:2])
combined <- combined[!(combined$node_name %in% filter_nodes), ]
matrix <- as.data.frame.matrix(table(combined))

summed <- rowSums(matrix[, c(1, 2, 3)])

combined <- data.frame(
  name = row.names(matrix),
  degree = summed,
  eu = matrix$eu,
  xka = matrix$xka,
  xauslander = matrix$xauslander
)

# combined <-
  # merge(combined, frequencies, by.x = "name", by.y = "node_name")

order.amount <- order(combined$degree, decreasing = TRUE)
combined <- combined[order.amount, ]

combined <- combined[match(unique(combined$name),combined$name),]
combined <- combined[, c("degree", "eu", "xka", "xauslander")]

datatable(
  combined,
  options = list(dom = 'BPfrtip', columnDefs = list(
    # list(searchPanes = list(show = FALSE), targets = 1:1),
    list(searchPanes = list(show = TRUE), targets = 1:1),
    list(searchPanes = list(show = FALSE), targets = 2:4)
    )),
  extensions = c('Select', 'SearchPanes', 'Buttons'),
  selection = 'none'
) %>%
  formatStyle('eu',
              color = styleInterval(0, c('lightgrey', 'lightblue')),
              backgroundColor = styleInterval(0, c('lightgrey', 'lightblue'))) %>%
  formatStyle('xauslander',
              color = styleInterval(0, c('lightgrey', 'lightblue')),
              backgroundColor = styleInterval(0, c('lightgrey', 'lightblue'))) %>%
  formatStyle('xka',
              color = styleInterval(0, c('lightgrey', 'lightblue')),
              backgroundColor = styleInterval(0, c('lightgrey', 'lightblue')))
