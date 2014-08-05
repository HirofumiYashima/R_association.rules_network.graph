
# load packages
require(arules)
require(arulesViz)
require(rgexf)

# load data
data(Income)


# implement association rule analysis from loaded data "Income"
data.ap <- apriori(Income, parameter=list(support=0.5))

# 16 association rules have been detected


# plot network graph with using plot() function of {arulesViz} packages and save a graph as igraph class object
graph.by.igraph <- plot(data.ap, method="graph", control=list(type="items",cex=0.6),margin=-0.1)

print(class(graph.by.igraph))  # igraph class

# convert igraph class object into graphML file with using write.graph() function, which consists {rgexf} package
write.graph(graph.by.igraph, "association.rules.2.graphml", format="graphml")

# Start network graph generating software "Gephi" to import graphML file
# Generate network graph ( set  parameter "support" to node size, parameter "lift" to node color )
# Then, you can obtain almost same network graph as the one which you gained from R's {arulesViz} plot() function

