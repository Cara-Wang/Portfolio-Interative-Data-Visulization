install.packages("tidyverse")
install.packages("networkD3")

if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/navdata")

library(tidyverse)
library("navdata")
data("phone.call2")
# nodes <- phone.call2$nodes
# edges <- phone.call2$edges
nodes <- read.csv('C:/Users/EllenFan/Desktop/node4.csv')
edges <- read.csv('C:/Users/EllenFan/Desktop/edge3.csv')

forceNetwork(Links, Nodes, Source, Target,
             Value, NodeID, Nodesize, Group)

nodes_d3 <- mutate(nodes, index = index - 1)
#nodes_d3 <- mutate(nodes, id = id - 1)

library(networkD3)
edges_d3 <- mutate(edges, from = from - 1, to = to - 1)

ColourScale <- 'd3.scaleOrdinal().domain(["lions", "tigers"])
           .range(["#FF6900", "#694489"]);'

forceNetwork(
  Links = edges_d3, Nodes = nodes_d3,
  Source = "from", Target = "to",      # so the network is directed.
  NodeID = "node", Group = "index", Value = "weight",Nodesize='assets',
  colourScale = JS("d3.scaleOrdinal(d3.schemeCategory10);"), 
  linkDistance = 220,
  linkColour="#D3D3D3",
  opacity = 1, fontSize = 16, zoom = TRUE
)
# forceNetwork(
#   Links = edges_d3, Nodes = nodes_d3,  
#   Source = "from", Target = "to",      # so the network is directed.
#   NodeID = "label", Group = "id", Value = "weight", 
#   opacity = 1, fontSize = 16, zoom = TRUE
# )

data("phone.call")
