# Testing with `Minitest`

 ### Why do we need to test our code?

- Developers write tests to prevent regression in their codebase. If any changes were made to the code we don't have to manually check it every time to see if it still works. 
- We run unit tests before, during or after the program is implemented. It's likely you'll have to jump back and forth between testing and implementation. 

## 1. Testing Terminology

#### **Test Suite:**

- The whole set of tests that complements your program. A test suite contains many tests for a single project.  

#### **Test**:

- A situation or context where specific checks are verified. A test may contain one or more assertions. Eg. making sure you get an error message when trying to log in with a password.

#### **Assertions:**

-  A step that verifies if the data returned matches the program's expectation. There are one or more assertions within a test.

#### **Refutations:** 

- Refutations are the opposite of assertions because they attempt to refute a test rather than assert it. Refutations pass if the object passed to it as an argument evaluates to false. There is a refutation version for every assertion eg. `refute_equal`, `refute_nil` etc. They're not often used.

#### **Code Coverage:**

- Code coverage measures how much a program is tested by its test suite. Its used as a metric to gauge the quality of our tests.
- Ruby has a gem called Simple Cov which calulates the total percentage of tests covered by the program's test suite. 
- It's not always necessary to have 100% test coverage but it depends on the project. The more fault tolerant the program is the higher the test coverage should be.

#### Unit testing

- unit testing is where individual units of code are tested against an associated program to determine whether it is fit for use

#### `seed`

-  Tells Minitest what order the tests were run in.

#### `'require' minitest/autorun`

- require loads all necessary files from the Minitest gem

#### `'require' relative`

- require loads the file that contains the class needed to test against by specifying its filepath.

#### `.FS`

- The status of the tests that were run
  - '.' indicates the test passed
  - 'F' indicates the test failed
  - 'S' indicates the test was skipped with `skip`

#### `YourClassTest < MiniTest::Test`

- The test class that sublcasses from the `MiniTest::Test` class to inherit all the necessary methods for testing

## 2. Minitest vs. RSpec

#### 2a. Minitest

- Minitest is the default testing library that comes with Ruby. 
- Minitest does everything Rspec can except it uses straightforward ruby syntax and reading more like normal ruby code. It's not a DSL
- Minitest tests come in 2 styles: assert-style and spec-style syntax. spec-style is used to appease RSPec users, but assert-style is more accessible for budding ruby programmers.

#### 2b. Rspec

- Rspec is a Domain Specific Language (DSL) for writing tests. 
- Rspec opts for readability over simplicity and is written more like normal English. 
- RSpec doesn't come installed with Ruby. MiniTest does.

## 3. SEAT approach

The SEAT approach prescribes the 4 steps to running any test.  Setup, Execute, Assert and Teardown. The 'S' and 'T' in particular reduces redundancy in your test suite, while E and A are the minimum requirements to be able to test your code.

| Acronym      | meaning                                                      |
| ------------ | ------------------------------------------------------------ |
| **S**etup    | **Setup necessary objects.** The `setup` instance method is run BEFORE EVERY `test_` . instantiate any objects you want to test and assign them to instance variables so the tests can access them. |
| **E**xecute  | **Execute the code against the object being tested:** This is where we run our code on the object we want to test |
| **A**ssert   | **Assert the results of the execution:** This is where we verify if the expected result matches the actual result |
| **T**eardown | **Teardown and cleanup lingering artifacts:** The `teardown` method is run AFTER EVERY `test_`.  We don't always need a `teardown` but it can be used when cleaning up files, logging information or closing database connections. |

## 4. Assertions

| assertion                          | meaning                                   |
| ---------------------------------- | ----------------------------------------- |
| `assert(test)`                     | passes if `test` evaluates to true        |
| `assert_equal(exp, act)`           | passes if the `exp` == `act`              |
| `assert_nil(obj)`                  | passes if `object` == `nil`               |
| `assert_raises(*exp){...}`         | passes if block raises specified `exp`    |
| `assert_instance_of(cls, obj)`     | passes if `obj` is an instance of `cls`   |
| `assert_same(obj1, obj2)`          | passes if they are the same object        |
| `assert_includes(collection, obj)` | passes if `obj` is included in collection |

#### 4a. `assert_equal` and equality

- `assert_equal` tests for *value equality* by invoking the `==` method. If you are using `assert_equal` on custom classes then you must implement `==` to tell Minitest how to compare your custom objects.
- `assert_same` on the other hand tests for *object equality* and will only pass if the object 1 has the same object id as object 2 (or are referencing the same object). 

#### 4b. `assert_includes` counts as 2 assertions

- This is because it also calls `assert_equal` in its method implementation.