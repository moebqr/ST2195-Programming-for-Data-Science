# Tutorial for mlr3 - Part 1. Basics
# https://mlr-org.com/gallery/basic/2020-03-11-basics-german-credit/

# Ensure all packages are installed including data.table, ggplot2, rchallenge, and skimr
# install.packages("data.table")
# install.packages("ggplot2")
# install.packages("rchallenge")
# install.packages("skimr")

library('data.table')
library('ggplot2')
library('rchallenge')
library('skimr')

# Load main packages
install.packages("mlr3verse")
# install.packages("mlr3learners")
# install.packages("mlr3tuning")
# install.packages("data.table")
# install.packages("ggplot2")
install.packages("mlr3")

library("mlr3")
library("mlr3verse")
library("mlr3learners")
library("mlr3tuning")
library("data.table")
library("ggplot2")

lgr::get_logger("mlr3")$set_threshold("warn")

# Data used from 1994 German Credit available here at UCI data repository
# https://archive.ics.uci.edu/dataset/144/statlog+german+credit+data

# Importing the data
data("german", package = "rchallenge")

# Exploring the data
dim(german)
str(german)
skimr::skim(german)
# In exploratory data analysis check: skewed distributions, missing values, rare factor vraiables?

# Task Definition: we are modelling the credit_risk which is a classification problem
task = as_task_classif(german, id = "GermanCredit", target = "credit_risk")

# The same data is available in mlr3
tsk("german_credit")    # Sets task using tsk()

# Learner definition: mlr3 has standard learners, but mlr3learners has more and mlr3extralearners even more
# all are defined in the following dictionary
mlr_learners

# Select learners for our problem: classification
library("mlr3learners")
learner_logreg = lrn("classif.log_reg")
print(learner_logreg)

# Training - Logistic Regression
train_set = sample(task$row_ids, 0.8 * task$nrow)
test_set = setdiff(task$row_ids, train_set)

# Fit the model
learner_logreg$train(task, row_ids = train_set)

# Examine the resulting model after fitting
learner_logreg$model

class(learner_logreg$model)
summary(learner_logreg$model)

# Training - Random Forest (ranger)
# By selecting importance = "permutation" the learner does feature importance determination

# install.packages("ranger")
# library("ranger")

learner_rf = lrn("classif.ranger", importance = "permutation")
learner_rf$train(task, row_ids = train_set)

# Examine importance the plot it
learner_rf$importance()

importance = as.data.table(learner_rf$importance(), keep.rownames = TRUE)
colnames(importance) = c("Feature", "Importance")
ggplot(importance, aes(x = reorder(Feature, Importance), y = Importance)) +
  geom_col() + coord_flip() + xlab("")

# Prediction
# the model can be used to classify new credit applicants w.r.t. their associated 
# credit risk (good vs. bad) on the basis of the features

# Predict classes
prediction_logreg = learner_logreg$predict(task, row_ids = test_set)
prediction_rf = learner_rf$predict(task, row_ids = test_set)

prediction_logreg

prediction_rf

# Convert to data table or confusion matrix
prediction_logreg$confusion
prediction_rf$confusion

learner_logreg$predict_type = "prob"
learner_logreg$predict(task, row_ids = test_set)

# Performance Evaluation
# must split into training and testing sets
# in mlr3 we specify the sampling method here: cv, bootstrap, etc.
resampling = rsmp("holdout", ratio = 2/3)
print(resampling)

res = resample(task, learner = learner_logreg, resampling = resampling)
res

# Use $aggregate() to see final measure: classification error (lower is better)
res$aggregate()

# Resampling using other mthods: try cv, subsampling, etc.

resampling = rsmp("subsampling", repeats = 10)
rr = resample(task, learner = learner_logreg, resampling = resampling)
rr$aggregate()

resampling = resampling = rsmp("cv", folds = 10)
rr = resample(task, learner = learner_logreg, resampling = resampling)
rr$aggregate()

# We next change the measure to False Positives Rate
# false positive rate
rr$aggregate(msr("classif.fpr"))

# false positive rate and false negative
measures = msrs(c("classif.fpr", "classif.fnr"))
rr$aggregate(measures)

# Here is a list of resampling methods and measures
mlr_resamplings
mlr_measures

# Performance Comparison and Benchmarks
# Here we compare multiple learners and multiple resampling methods

learners = lrns(c("classif.log_reg", "classif.ranger"), predict_type = "prob")
grid = benchmark_grid(
  tasks = task,
  learners = learners,
  resamplings = rsmp("cv", folds = 10)
)
bmr = benchmark(grid)

# future::plan("multicore") # uncomment for parallelization

measures = msrs(c("classif.ce", "classif.auc"))
performances = bmr$aggregate(measures)
performances[, c("learner_id", "classif.ce", "classif.auc")]

# Changing the hyperparameters from the defaults
# notice difference between parameters and hyperparameters

learner_rf$param_set

learner_rf$param_set$values = list(verbose = FALSE)

## ?ranger::ranger
as.data.table(learner_rf$param_set)[, .(id, class, lower, upper)]

# For the random forest two meaningful parameters which steer model complexity are 
# num.trees and mtry. num.trees defaults to 500 and mtry to floor(sqrt(ncol(data) - 1)), 
# in our case 4.

rf_med = lrn("classif.ranger", id = "med", predict_type = "prob")

rf_low = lrn("classif.ranger", id = "low", predict_type = "prob",
             num.trees = 5, mtry = 2)

rf_high = lrn("classif.ranger", id = "high", predict_type = "prob",
              num.trees = 1000, mtry = 11)

learners = list(rf_low, rf_med, rf_high)
grid = benchmark_grid(
  tasks = task,
  learners = learners,
  resamplings = rsmp("cv", folds = 10)
)

bmr = benchmark(grid)
print(bmr)

# compare misclassification rate and AUC 
measures = msrs(c("classif.ce", "classif.auc"))
performances = bmr$aggregate(measures)
performances[, .(learner_id, classif.ce, classif.auc)]

autoplot(bmr)

