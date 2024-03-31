data3<-read.csv("C:/Users/eyohe/Desktop/CC GENERAL.csv",header=TRUE)

data3 <- data3[, -1]

data3<-na.omit(data3)

set.seed(240)

# K-means clustering
kmeans_model <- kmeans(data3, centers = 3, nstart = 20)
kmeans_clusters <- kmeans_model$cluster
print(kmeans_clusters)


# Hierarchical clustering (Agglomerative)
hc_model <- hclust(dist(data3))
hc_clusters <- cutree(hc_model, k = 3)
print(hc_clusters)


# DBSCAN clustering
dbscan_model <- dbscan(data3, eps = 0.5, MinPts = 5)
dbscan_clusters <- dbscan_model$cluster
print(dbscan_clusters)


# Plotting the results
fviz_cluster(list(
  kmeans = list(data = data3, cluster = kmeans_clusters),
  hclust = list(data = data3, cluster = hc_clusters),
  dbscan = list(data = data3, cluster = dbscan_clusters)
))
