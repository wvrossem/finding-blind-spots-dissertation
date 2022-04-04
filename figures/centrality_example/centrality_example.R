library(DiagrammeR)

grViz(
  "
graph boxes_and_circles {

  # a 'graph' statement
  graph [
    overlap = false,
    fontsize = 9,
    layout = neato
  ]

  # several 'node' statements
  node [shape = box,
        fontname = Helvetica,
        style = filled,
        color = grey]
  dm1 [label = 'Doc group 1']
  dm2 [label = 'Doc group 2']
  dm3 [label = 'Doc group 3']

  node [shape = ellipse,
        fixedsize = false,
        style = solid,
        color = black]
  cg1 [label = 'surname']
  cg2 [label = 'nationality']
  cg3 [label = 'sex']
  cg4 [label = 'fingerprint data']
  cg5 [label = 'visa data']
  cg6 [label = 'operator data']
  cg7 [label = 'date of birth']
  cv1 [label = 'visa issue date']
  cv2 [label = 'visa type']
  cv3 [label = 'travel doc']

  # several 'edge' statements
  dm1 -- {cg1 cg2 cg3 cg5}
  dm2 -- {cg2 cg4 cg6}
  dm3 -- {cg1 cg2 cg7}
  cg5 -- {cv1 cv2 cv3}
}
")
