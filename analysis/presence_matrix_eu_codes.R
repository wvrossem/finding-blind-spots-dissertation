library(flextable)

file_path_data <- "/Users/woutervanrossem/PhD/Writings/2020_Ontology-analysis/analysis/data/"

node_type <- "code"
filter_nodes <- c("System native", "System pre-existant")

eurodac <- read.csv(file = paste(file_path_data, "eurodac.csv", sep = ""),head=TRUE,sep=",")
eurodac <- eurodac[eurodac$node_type == node_type,]
eurodac['source'] = 'eurodac'
eurodac <- eurodac[, c("node_name", "source")]

sis <- read.csv(file = paste(file_path_data, "sis.csv", sep = ""),head=TRUE,sep=",")
sis <- sis[sis$node_type == node_type,]
sis['source'] = 'sis'
sis <- sis[, c("node_name", "source")]

vis <- read.csv(file = paste(file_path_data, "vis.csv", sep = ""),head=TRUE,sep=",")
vis <- vis[vis$node_type == node_type,]
vis['source'] = 'vis'
vis <- vis[, c("node_name", "source")]

xka<- read.csv(file = paste(file_path_data, "xka.csv", sep = ""),head=TRUE,sep=",")
xka <- xka[xka$node_type == node_type,]
xka['source'] = 'xka'
xka <- xka[, c("node_name", "source")]

xauslander <- read.csv(file = paste(file_path_data, "german_xauslander.csv", sep = ""),head=TRUE,sep=",")
xauslander <- xauslander[xauslander$node_type == node_type,]
xauslander['source'] = 'xauslander'
xauslander <- xauslander[, c("node_name", "source")]

combined <- rbind(eurodac,sis,vis,xka,xauslander)
combined <- combined[!(combined$node_name %in% filter_nodes),]
matrix <- as.data.frame.matrix(table(combined))

combined <- data.frame(
  name=row.names(matrix),
  eurodac=matrix$eurodac,
  sis=matrix$sis,
  vis=matrix$vis,
  xka=matrix$xka,
  xauslander=matrix$xauslander
)

ft <- flextable(
  combined,
  col_keys = c("name", "eurodac", "sis", "vis", "xka", "xauslander"))
ft <- autofit(ft)
ft <- bold(ft, part = "header")
ft <- set_header_labels(ft, name = "", eurodac = "EU",
                        sis = "SIS", vis = "VIS", xka = "Hellenic", xauslander = "German")

ft <- merge_at(ft, i = 1, j = 2:4, part = "header")
ft <- add_header_row(ft, values = c("", "Eurodac", "SIS", "VIS", "XKA", "XAüslander"), top = FALSE )

color_presence <- "#7d90ae"
color_absence <- "white"

ft <- theme_box(ft)

ft <- bg(ft, ~ eurodac == 1, j = ~ eurodac, bg = color_presence)
ft <- color(ft, ~ eurodac == 1, j = ~ eurodac, color = color_presence)
ft <- bg(ft, ~ eurodac == 0, j = ~ eurodac, bg = color_absence)
ft <- color(ft, ~ eurodac == 0, j = ~ eurodac, color = color_absence)
ft <- bg(ft, ~ sis == 1, j = ~ sis, bg = color_presence)
ft <- color(ft, ~ sis == 1, j = ~ sis, color = color_presence)
ft <- bg(ft, ~ sis == 0, j = ~ sis, bg = color_absence)
ft <- color(ft, ~ sis == 0, j = ~ sis, color = color_absence)
ft <- bg(ft, ~ vis == 1, j = ~ vis, bg = color_presence)
ft <- color(ft, ~ vis == 1, j = ~ vis, color = color_presence)
ft <- bg(ft, ~ vis == 0, j = ~ vis, bg = color_absence)
ft <- color(ft, ~ vis == 0, j = ~ vis, color = color_absence)
ft <- bg(ft, ~ xka == 1, j = ~ xka, bg = color_presence)
ft <- color(ft, ~ xka == 1, j = ~ xka, color = color_presence)
ft <- bg(ft, ~ xka == 0, j = ~ xka, bg = color_absence)
ft <- color(ft, ~ xka == 0, j = ~ xka, color = color_absence)
ft <- bg(ft, ~ xauslander == 1, j = ~ xauslander, bg = color_presence)
ft <- color(ft, ~ xauslander == 1, j = ~ xauslander, color = color_presence)
ft <- bg(ft, ~ xauslander == 0, j = ~ xauslander, bg = color_absence)
ft <- color(ft, ~ xauslander == 0, j = ~ xauslander, color = color_absence)

ft <- align(ft, align = "center", part = "all")

ft <- autofit(ft)
