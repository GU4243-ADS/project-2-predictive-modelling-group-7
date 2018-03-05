#########################################################
### Train a classification model with training images ###
#########################################################

### Author: Mao Guan, Michael Sheng, Nicole Smith, Kenny Warner, Jessica Zhang
### Project 2
### ADS Spring 2018


gbm_train <- function(dat_train, label_train){
  library(gbm)
  
  fit_gbm <- gbm.fit(x = dat_train, y = label_train,
                     n.trees = 2000,
                     distribution = "bernoulli",
                     interaction.depth = 3,
                     bag.fraction = 0.5,
                     verbose = FALSE)
  best_iter <- gbm.perf(fit_gbm, method = "OOB", plot.it = FALSE)

  return(list(fit = fit_gbm, iter = best_iter))
}


xgb_train <- function(dat_train, label_train){
    
    library(xgboost)
    
    fit_xgb <- xgboost(data = dat_train, label = label_train,
                        max.depth = 3,
                        eta = 0.5,
                        nround = 20,
                        nthread = 2,
                        objective = "binary:logistic")
   
}
