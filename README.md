# Spring2018
<img src="https://phz8.petinsurance.com/-/media/all-phz-images/2016-images-850/dogscatssnuggling850.jpg" alt="GitHub" title="Dogs and Cats" width="500" height="300" />

# Project 2: Predictive Modelling

----
### [Project Description](doc/)

Term: Spring 2018

+ Project title: Dogs or Cats? Image Classification
+ Team Number: 7
+ Team Members: Mao Guan, Nicole Smith, Michael Sheng, Kenny Warner, and Jessica Zhang. 
+ Project summary: In this project, we created a classification engine for images of dogs versus cats. ([main.Rmd](doc/main.Rmd))
	+ Baseline model: GBM with SIFT features,  ___ % accuracy.
	+ Proposed model: XGBoost with HOG features, with 74% accuracy. 

+ Project details: We discussed several classification models including GBM, XGBoost, Random Forest, logistic regression, convolutional neural network (CNN), K-Nearest Neighbors, linear SVM, and RBF SVM. We also HOG and SIFT features on each of the models and compared the prediction error and computational time. 

Contribution statement: [default](doc/a_note_on_contributions.md) All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement.

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is organized as follows.

Classifier\Features | SIFT | HOG
---- | --- | ---
Gradient Boosting(Baseline) | Accuracy:|  Accuracy:
CNN | Accuracy:|  Accuracy: 68%
XGBoost | Accuracy:68%|  Accuracy:74%
Random Forest |  Accuracy: 72% | Accuracy: 64% 
SVM(Linear) | Accuracy: 67% | Accuracy: 67%
SVM(RBF) | Accuracy: 67% | Accuracy: 67%
Logistic Regression | Accuracy: 67% | Accuracy: 67% 
kNN | Accuracy: 70% | Accuracy: 60%
Multi-Layer-Perceptron| Accuracy: 69% | Accuracy: 67%
```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
