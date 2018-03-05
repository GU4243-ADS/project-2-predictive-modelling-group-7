######################################################
### Fit the classification model with testing data ###
######################################################

### Author: Mao Guan, Michael Sheng, Nicole Smith, Kenny Warner, Jessica Zhang
### Project 2
### ADS Spring 2018

gbm_test <- function(fit_train, dat_test){
  library(gbm)
  pred <- predict(fit_train$fit, newdata = dat_test, 
                  n.trees = fit_train$iter, type = "response")
  pred <- data.frame(pred[,,1])
  colnames(pred) <- c('0','1','2')
  pred_label <- apply(pred,1,function(x){return(which.max(x)-1)})
  return(pred_label)
}

xgb_test <- function(model, dat_test, label_test){
    ibrary(xgboost)
    
    pred_label <- predict(model, data.matrix(dat_test))
    return(pred_label)
}

