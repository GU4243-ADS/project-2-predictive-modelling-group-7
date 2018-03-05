#############################################################
### Construct visual features for training/testing images ###
#############################################################

### Authors: Yuting Ma/Tian Zheng
### Project 3
### ADS Spring 2017

feature.hog <- function(img_dir, export=TRUE){
  
  ### Construct process features for training/testing images
  ### Sample simple feature: Extract row average raw pixel values as features
  
  ### Input: a directory that contains images ready for processing
  ### Output: an .RData file contains processed features for the images
  
  ### load libraries
  library(EBImage)
  library(OpenImageR)

  dir_names <- list.files(img_dir)
  num_files <- length(list.files(img_dir))
  
  files <- mixedsort(sort(dir_names))

  # test image 1
  img0 <- readImage(paste0(img_dir,  files[1])) # change dir_names to files so images are in order pet1, pet2 instead of pet1, pet10. 

  h1 <- HOG(img0, cells = 3, orientations = 6)

  # store the HOG features
  H <- matrix(NA, num_files,length(h1)) 

  hog_train <- for(i in 1:num_files){
    img <- readImage(paste0(img_dir, files[i]))
    H[i,] <- HOG(img,cells = 3, orientations = 6)
  }
  
  ### output constructed features
  if(export){
    save(hog_train, file = paste0("../output/HOG.RData"))
  }
  write.csv(hog_train, file = "../output/hog_features.csv", row.names = F)

  return(hog_train)
}
