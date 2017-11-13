library(predmodel)
library(testthat)

context("Testing context")

test_that(desc = "Test",
          code = {
            expect_true(5 > 3)
            expect_true(pi < 3)
          })
