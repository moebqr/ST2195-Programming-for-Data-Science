# From https://mlr-org.com/gallery/basic/2020-03-11-mlr3pipelines-tutorial-german-credit/index.html

library("mlr3verse")
library("data.table")
library("ggplot2")

set.seed(7832)
lgr::get_logger("mlr3")$set_threshold("warn")
lgr::get_logger("bbotk")$set_threshold("warn")

task = tsk("german_credit")
credit_full = task$data()
credit = credit_full[, sapply(credit_full, FUN = is.factor), with = FALSE]

# sample values to NA
credit = credit[, lapply(.SD, function(x) {
  x[sample(c(TRUE, NA), length(x), replace = TRUE, prob = c(.9, .1))]
})]
credit$credit_risk = credit_full$credit_risk
task = TaskClassif$new("GermanCredit", credit, "credit_risk")

cv10 = rsmp("cv")$instantiate(task)

# List missing values
task$missings()

# This will not work because of missing values
ranger = lrn("classif.ranger")
ranger$train(task)

# List imputation methods available
mlr_pipeops$keys("^impute")

# Impute missing values using iputeoor
imputer = po("imputeoor")
task_imputed = imputer$train(list(task))[[1]]
task_imputed$missings()
head(task_imputed$data())

# To avoid data leakage we attach the impute method to the Learner graph
graph_learner_ranger = as_learner(po("imputeoor") %>>% ranger)

graph_learner_ranger$train(task)

rr = resample(task, learner = graph_learner_ranger, resampling = cv10)
rr$aggregate()

# Feature Filtering
install.packages("praznik")
library("praznik")

mlr_filters

# Apply the FilterMIM (mutual information maximization)
filter = flt("mim")
filter$calculate(task_imputed)$scores

# We next design a pipe that applies the filter on the complete data
fpipe = po("imputeoor") %>>% po("filter", flt("mim"), filter.nfeat = 3)
fpipe$train(task)[[1]]$head()

# We can now tune over the mim.filter.nfeat parameter. 
search_space = ps(
  mim.filter.nfeat = p_int(lower = 1, upper = length(task$feature_names))
)

# Do a grid search since the problem is one-dimensional
instance = tune(
  tuner = tnr("grid_search"),
  task,
  learner = fpipe %>>% lrn("classif.ranger"),
  resampling = cv10,
  measure = msr("classif.ce"),
  search_space = search_space)

# Plot the performance against the number of features
install.packages('patchwork')
library('patchwork')
autoplot(instance, type =  "marginal")

# Next let's build a model with predictions of other learners
install.packages('kknn')
library('kknn')

graph_stack = po("imputeoor") %>>%
  gunion(list(
    po("learner_cv", lrn("classif.ranger", predict_type = "prob")),
    po("learner_cv", lrn("classif.kknn", predict_type = "prob")))) %>>%
  po("featureunion") %>>% lrn("classif.log_reg")

# Visualize the new pipline design
graph_stack$plot(html = FALSE)

# Compare performance of stacked learners to individual learner
grid = benchmark_grid(
  task = task,
  learner = list(
    graph_stack,
    as_learner(po("imputeoor") %>>% lrn("classif.ranger")),
    as_learner(po("imputeoor") %>>% lrn("classif.kknn")),
    as_learner(po("imputeoor") %>>% lrn("classif.log_reg"))),
  resampling = cv10)

bmr = benchmark(grid)

graph_stack$train(task)
summary(graph_stack$pipeops$classif.log_reg$state$model)
# The random forest has a higher contribution.

#Robustify

task = tsk("german_credit")

task_unseen = task$clone()$filter(1:30)
learner_logreg = lrn("classif.log_reg")
learner_logreg$train(task_unseen)
learner_logreg$predict(task)

task_constant = task$clone()$filter(1:2)
learner_logreg = lrn("classif.log_reg")
learner_logreg$train(task_constant)

# Solution
robustify = po("fixfactors") %>>%
  po("removeconstants") %>>%
  po("imputesample", affect_columns = selector_type(c("ordered", "factor")))

robustify$plot(html = FALSE)

graph_learner_robustify = as_learner(robustify %>>% learner_logreg)

graph_learner_robustify$train(task_constant)
graph_learner_robustify$predict(task)

