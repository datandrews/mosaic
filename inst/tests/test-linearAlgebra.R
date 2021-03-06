context('Linear Algebra')


test_that("dot works for vectors", {
  x <- c(1,2,3)
  u <- c(1,1,1)
  expect_equivalent( dot(x,u), 6 )
})

test_that("project works for vectors", {
  x <- c(1,2,3)
  u <- c(1,1,1)
  n <- 10
  y <- rnorm(n)
  one <- rep(1,n)
  expect_equivalent( project(x, c(1,0,0)), c(1,0,0) ) 
  expect_equivalent( project(x, c(0,1,0)), c(0,2,0) )
  expect_equivalent( project(x, c(0,0,1)), c(0,0,3) )
  expect_equivalent( project(x, u),  c(2,2,2) ) 
  expect_equivalent( project(y, one), rep(mean(y), n) )
})

test_that("1 vector works", {
  x <- c(1,2,3)
  u <- c(1,1,1)
  y <- rnorm(10)
  expect_equivalent( project(x,1), c(2,2,2) )
  expect_equivalent( project(y,1),  rep(mean(y),length(y)) ) 
})

test_that("formula interface to project works in present environment",{
  x <- c(1,2,3)
  b <- c(5,4,3)
  expect_that( project(b~x)[1], equals(1.571429, tol=0.00001))
  expect_that( project(b~x+1)[1], equals(6))
})

test_that("formula interface works with data frame",{
  expect_that( project( wage ~ educ, data=CPS85)[1], equals( 0.6954, tol=0.0001))
  expect_that( project( wage ~ educ+1, data=CPS85)[1], equals( -0.7460, tol=0.0001))
})
