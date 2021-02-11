# Blocks

## 1. Closures & Scope

#### 1a. What are closures?

- Closures are a way to save and pass around anonymous "chunks of code" that can be executed at a later time. Ruby implements closures in 3 different ways: through blocks, procs and lambdas.

#### 1b. How does closure scope work?

- These "executable chunks of code" are called closures because they retain references to their surrounding artifacts (variables, methods objects etc.) by forming an "enclosure" around them. These artifacts are then said to be apart of a closures **binding** and can be safely referred to when the closure is executed later on.

## 2. When & how blocks work

#### 2a. How blocks work

```ruby
3.times { |num| puts num }
```

​	There 3 components to invoking a method with an associated block:

​	i. The object that invoked the method - the integer `3` 

​	ii. The method invoked on the object - the `Integer#times` method 

​	iii. The block passed in as an argument to the method invocation - the `{..}` part

#### 2b. When to use blocks

- i.  To defer some implementation code to the method invocation
  - blocks are great for pushing some decisions to method invocation time.
  - It allows method callers to refine a method at invocation time for a specific use case. It allows method implementers to build generic methods that can be used in a variety of ways.

- ii. To perform a 'before' and 'after' action - sandwich code
  - blocks are great for wrapping logic, where you need to perform some before/after actions.
  - blocks are a good use case for "sandwich code" scenarios, like closing a `File` automatically.

## 3. Blocks & variable scope

- Closures have the ability to drag around their surrounding context/environment wherever they go. 
- This implies that all artifacts (methods, objects, variables) that were in scope at the time of the closures creation are apart of its **binding**. This means that if a closure makes reference to ones of these artifacts they can do so safely as they have all the information they need to be executed correctly later. 
- This is at the core of how local variable scoping works in Ruby - that is how inner scopes have access to outer scopes.

- A closure's binding consists of artifacts that were in scope at the point at which the closure was created; by artifacts we mean things like varaibles, method references, etc.

- The important thing to remember in the context of closures in Ruby is that the binding includes what was in scope at the point the closure was created. The binding is everything that the block of code can access that is defined somewhere other than the block

- Any variables that need to be accessed in a proc (or block/ lambda) must be defined *before* the proc is created (or passed as an argument when the proc is called).

- ```ruby
  my_proc = Proc.new do |num|
    p num
  end
  
  c = 3
  my_proc.call
  #=> nil
  my_proc.call(c)
  #=> 3
  # this works, but only because we are passing in c as an argument to the  Proc.call method, *not* because c is part of the proc's binding
  ```

-  The crucial thing is that blocks can access the binding from where they were defined.

- Objects of class Binding encapsulate the execution context at some particular place in the code and retain this context for future use. The variables, methods, value of self, and possibly an iterator block that can be accessed in this context are all retained.

## 4. write block & proc methods

### blocks vs procs:

- Procs are objects instantiated from the `Proc` class - blocks are not objects at all
- `Procs` are explicit parameters to a method definition and invoke the `call` method to execute its block of code
- Blocks associated with a method on the other hand are implicitly available as a parameter and executed using the  `yield` keyword
-  Procs are more flexible than blocks and can be passed around from method to method easily.

#### methods that take blocks (implicit parameter)

- we can write our own methods that take a block with the `yield` keyword.

#### methods that take procs (explicit parameter)

- Explicit blocks give us the ability to have our block assigned to a variable via a `Proc`. This increases its flexibility and allows us to pass the block to another method.
- we use `&` to prefix our method parameter to convert our block into a simple `Proc` object.

## 5. block arguments & return values

- Blocks are similar to methods in the sense that they can also be passed arguments that are assigned to parameters and have return values.
- Unlike methods however blocks don't complain (throw an error) if the number of arguments passed to it does not reflect the number of parameters it has. This is what is referred to as having lenient arity (which by comparison methods have a strict arity). 
- when we use `yield` within a method, we can also pass in arguments which are assigned as parameters to the associated block.
- The return value of the block becomes the return value for `yield`. It is important to be aware of what the block is returning especially if we intend to use its return value in the method implementation.

## 6. when to pass blocks into methods

- Every method in Ruby can have a block associated with it at invocation. However it is silently ignored unless the block is yielded to using the `yield` keyword.
- It is up to the method's implementation to handle how and if a block's return value is used when the method is invoked
- A method can retain the option to be invoked with or without a block by wrapping the `yield` keyword in a conditional in conjunction with the method `Kernel#block_given?`

## 7. `&:symbol`

- if a block passed in as an argument to a method invocation is doing simple conversion with a single method, we can simplify it using the `symbol

- the `Symbol#to_proc` is a nice shortcut when working with collections.
-  you can use a shortcut when calling methods with blocks by using the symbol-to-proc trick.