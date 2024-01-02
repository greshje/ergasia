# Define the R6 class
MyClass <- R6Class(
  "MyClass",
  
  public = list(
    # Function to print "hello world"
    client = function() {
      cat("Hello world\n")
    },
    
    # Function that calls the "client" function
    test = function() {
      self$client()  # Call the "client" function within the class
    }
  )
)

# Create an instance of the class
my_instance <- MyClass$new()

# Call the "test" function, which in turn calls the "client" function
my_instance$test()
