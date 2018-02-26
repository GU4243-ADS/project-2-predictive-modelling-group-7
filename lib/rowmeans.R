#############################################################
### Construct visual features for training/testing images ###
#############################################################

### Based off of code by: Yuting Ma/Tian Zheng
### Authors: Nicole Smith
### Project 2
### ADS Spring 2018

feature <- function(img_dir, export=T){
  
  ### Construct process features for training/testing images
  ### Sample simple feature: Extract row average raw pixel values as features
  
  ### Input: a directory that contains images ready for processing
  ### Output: an .RData file contains processed features for the images
  
  ### load libraries
  library("EBImage")
  library(pbapply)
  
  n_files <- length(list.files(img_dir))
  n_files <- 200
  
  ### determine img dimensions
  # img0 <-  readImage(paste0(img_dir, "pet", "_", ".jpg"))
  # mat1 <- as.matrix(img0)
  # n_r  <- nrow(img0)
  
  
  ### store vectorized pixel values of images
  dat <- matrix(NA, n_files, 300)
  imgs <- vector("list", n_files)
  
  
  for(i in 1:n_files){
      img <- readImage(paste0(img_dir, "pet", i, ".jpg"))
      imgs[[i]] <- img
      bw_img <- channel(img, "gray")
      bw_img <- resize(bw_img, 300)
      dat[i, ] <- rowMeans(bw_img)
  }

  
  ### resize images
  # img_resized = pblapply(imgs, function(img) { resize(img, 128, 128) })
  # dim(img_resized[[1]])
  
  
  
  ### output constructed features
  if(export){
    save(dat, file = paste0("./output/feature_", ".Rdata"))
  }
  return(dat)
}
