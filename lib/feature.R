#############################################################
### Construct visual features for training/testing images ###
#############################################################

### Authors: Mao Guan, Michael Sheng, Nicole Smith, Kenny Warner, Jessica Zhang
### Project 2
### ADS Spring 2018

sift_features.load <- function(img_dir, new_data = FALSE)
{
  #load libraries
  library("cluster")
  library("reshape2")
  library("flexclust")
  library("gtools")
  
  
  #helper function to get features for each img
  load_img <- function(fname)
  {
    return (get(load(fname)[2]))
  }
  #helper function to get #features for each img
  load_featnames <- function(fname)
  {
    num_feats <- nrow(get(load(fname)[1]))
    
    return (rep(fname,num_feats))
  }
  
  file_names <- list.files(path= img_dir, pattern=".jpg.sift.Rdata",all.files=T, full.names=T, no.. = F)
  file_names <- mixedsort(sort(file_names))
  
  
  #feat_lab <- feature_label("../data/train-features/img999.jpg.sift.Rdata")
  
  #load features into matrix
  tm_load <- system.time(imgs <- lapply(file_names, load_img))
  imgs_matrix <- do.call("rbind",imgs)
  
  #get image names of each feature
  names_list <- unlist(lapply(file_names, load_featnames))
  
  cluster_size <- 10
  if(new_data)
  {
    clust_model <- get(load("../output/sift_kcca.Rdata"))
    clustered_features <- predict(clust_model,imgs_matrix)
  }
  else
  {
    system.time(clustered_sift_features <- kmeans(imgs_matrix,100,iter.max = 100, algorithm="MacQueen"))
    save(clustered_sift_features, file = "../output/sift_kmeans.Rdata")
    
    clustered_features <- clustered_sift_features$cluster
    
    clust_model <- as.kcca(clustered_sift_features,imgs_matrix)

  }
  #k-means clustering of features
  
  
  #for each image, get frequency of clusters for each feature
  labels <- data.frame(name = names_list, cluster = clustered_features)
  output <- dcast(labels,name~cluster)
  
  #order and get normalized frequency
  output$name = as.character(output$name)
  output_ordered <- output[mixedorder(output$name),]
  rownames(output_ordered) <- NULL
  sift_features <- apply(output_ordered[,-1], 2, function(i) i/sum(i))
  
  write.csv(sift_features, file = "../output/sift_features.csv",row_names = F)
  
  return(sift_features)
}
  
  
feature <- function(img_dir, set_name, data_name="data", export=T){
  
  ### Construct process features for training/testing images
  ### Sample simple feature: Extract row average raw pixel values as features
  
  ### Input: a directory that contains images ready for processing
  ### Output: an .RData file contains processed features for the images
  
  ### load libraries
  library("EBImage")
  
  n_files <- length(list.files(img_dir))
  
  ### determine img dimensions
  img0 <-  readImage(paste0(img_dir, "img", "_", data_name, "_", set_name, "_", 1, ".jpg"))
  mat1 <- as.matrix(img0)
  n_r  <- nrow(img0)
  
  ### store vectorized pixel values of images
  dat <- matrix(NA, n_files, n_r) 
  for(i in 1:n_files){
    img     <- readImage(paste0(img_dir,  "img", "_", data_name, "_", set_name, "_", i, ".jpg"))
    dat[i,] <- rowMeans(img)
  }
  
  ### output constructed features
  if(export){
    save(dat, file = paste0("../output/feature_", data_name, "_", set_name, ".RData"))
  }
  return(dat)
}
