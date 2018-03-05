######################################################
### Fit the classification model with testing data ###
######################################################

### Author: Mao Guan, Michael Sheng, Nicole Smith, Kenny Warner, Jessica Zhang
### Project 2
### ADS Spring 2018

gbm_test <- function(fit_train, dat_test){
  library(gbm)
  pred <- predict(fit_train$fit, newdata = dat_test, 
                  n.trees = gbm_sift$iter, type="response")
  pred_label <- round(pred)
  return(pred_label)
}

xgb_test <- function(model, dat_test, label_test){
    library(xgboost)
    
    pred_label <- predict(model, data.matrix(dat_test))
    return(pred_label)
}

