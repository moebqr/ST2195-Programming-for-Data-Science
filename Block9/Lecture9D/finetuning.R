library("mlr3verse")
library("data.table")
library("mlr3tuning")
library("ggplot2")


set.seed(7832)
lgr::get_logger("mlr3")$set_threshold("warn")
lgr::get_logger("bbotk")$set_threshold("warn")

task = tsk("german_credit")

# This sets up parallel processing using multiple processes
future::plan("multiprocess")

cv10 = rsmp("cv", folds = 10)

# fix the train-test splits using the $instantiate() method
cv10$instantiate(task)

# have a look at the test set instances per fold
cv10$instance

# install.packages("kknn")
library("kknn")

# Create a k-Nearest Neighbors (kNN) learner with probability prediction and rectangular kernel
knn = lrn("classif.kknn", predict_type = "prob", kernel = "rectangular")

# Display the parameter set of the kNN learner
knn$param_set

# Define the search space for hyperparameter tuning
# 'k' is the number of neighbors, ranging from 3 to 20
# 'distance' is the distance metric, either 1 (Manhattan) or 2 (Euclidean)
search_space = ps(
  k = p_int(3, 20),
  distance = p_int(1, 2)
)

# Create a tuning instance for batch single criterion optimization
# This includes the task, learner, resampling strategy, performance measure, terminator, and search space
instance_grid = TuningInstanceBatchSingleCrit$new(
  task = task,
  learner = knn,
  resampling = cv10,
  measure = msr("classif.ce"),
  terminator = trm("none"),
  search_space = search_space
)
# Create a grid search tuner with a resolution of 18 and a batch size of 36
tuner_grid = tnr("grid_search", resolution = 18, batch_size = 36)

# Display the current result of the tuning instance
instance_grid$result

# Optimize the tuning instance using the grid search tuner
tuner_grid$optimize(instance_grid)

# Display the result of the tuning instance after optimization
instance_grid$result

# Display the first few rows of the tuning archive as a data table
head(as.data.table(instance_grid$archive))

# Plot the classification error against the number of neighbors (k) and distance metric
ggplot(as.data.table(instance_grid$archive),
  aes(x = k, y = classif.ce, color = as.factor(distance))) +
  geom_line() + geom_point(size = 3)


