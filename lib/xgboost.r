#########################################################
### Train a classification model with training images ###
#########################################################

### Author: Nicole
### Project 3
### ADS Spring 2016


train <- function(dat_train, label_train, par = NULL){
  
  ### Train a Gradient Boosting Model (GBM) using processed features from training images
  
  ### Input: 
  ###  -  processed features from images 
  ###  -  class labels for training images
  ### Output: training model specification
  
  ### load libraries
  library(xgboost)
  
  ### Train with gradient boosting model
  # if(is.null(par)){
  #   depth <- 3
  #  } else {
  #   depth <- par$depth
  # }
  # fit_gbm <- gbm.fit(x = dat_train, y = label_train,
  #                   n.trees = 2000,
  #                   distribution = "bernoulli",
  #                   interaction.depth = depth,
  #                   bag.fraction = 0.5,
  #                   verbose = FALSE)
  # best_iter <- gbm.perf(fit_gbm, method = "OOB", plot.it = FALSE)
  
  # return(list(fit = fit_gbm, iter = best_iter))
  #}
  
  
  ### Train with XGboost
  if(is.null(par)){
    depth <- 3
  } else {
    depth <- par$depth
  }
  
  bst <- xgboost(data = dat_train, label = label_train,
                 max.depth = 2,
                 eta = .2,
                 nround = 2,
                 nthread = 2, objective = "binary:logistic")
  
  test.error <- sum(predict(bst, data.matrix(test[,-1])) != test[-1]/length(test[,1]))
}
  
# max.depth: depth of tree
# eta: step size shrinkage used to prevent overfitting; value between 0 and 1 (default 0.3)
# nround: number of trees
# nthread: number of CPU threads to use; can improve efficiency (no default)
