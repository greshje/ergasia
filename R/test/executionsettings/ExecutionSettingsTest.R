# ---
#
# Tests for ExecutionSettings
#
# ---

# libraries
library(testthat)

# ---
#
# tests
# 
# ---

test_that(
  "Execution settings are created",
  {
    expect_true(1 == 1)
    settings <- ExecutionSettings$new()$createExecutionSettings()
  }
)


