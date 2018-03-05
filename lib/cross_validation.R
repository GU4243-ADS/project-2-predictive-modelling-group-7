########################
### Cross Validation ###
########################

### Author: Mao Guan, Michael Sheng, Nicole Smith, Kenny Warner, Jessica Zhang
### Project 1
### ADS Spring 2018


gbm.cv.f <- function(X.train, y.train, d, K) {
  
  n        <- length(y.train)
  n.fold   <- floor(n/K)
  s        <- sample(rep(1:K, c(rep(n.fold, K-1), n-(K-1)*n.fold)))  
  cv.error <- rep(NA, K)
  
  for (i in 1:K){
    train.data  <- X.train[s != i,]
    train.label <- y.train[101][s != i]
    test.data   <- X.train[s == i,]
    test.label  <- y.train[101][s == i]
    
    par  <- list(depth = d)
    gbm_fit  <- gbm_train(dat_train, label_train)
    pred <- gbm_test(gbm_fit, test.data)
    cv.error[i] <- mean(pred != test.label)  
    
  }			
  return(c(mean(cv.error), sd(cv.error)))
}


xgb.cv.f <- function(train_df, train_label,max.depth=5, nround=100,K=K_folds){
    
    n <- dim(train_df)[1]
    n.fold <- floor(n/K)
    s <- sample(rep(1:K, c(rep(n.fold, K-1), n-(K-1)*n.fold)))
    cv.error <- rep(NA, K)
    
    for (i in 1:K){
        train.data <- train_df[s != i,]
        train.label <- train_label[s != i]
        test.data <- train_df[s == i,]
        test.label <- train_label[s == i]
        
        
        xgb_fit <- xgboost(data = data.matrix(train.data),
        label = train.label,
        max.depth = 3,
        eta = 0.5,
        nround = 10,
        nthread = 2,
        objective = "binary:logistic")
        
        
        pred_label <- predict(xgb_fit, data.matrix(test.data))
        cv.error[i] <- mean(pred_label != test.label)
        
    }
    return(mean(cv.error))
    
}
