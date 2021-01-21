## `&`

Prefixing the last method parameter with an `&` symbol converts an associated block to a `Proc` object. This increases flexibility and allows us to pass the block around, and even return it if we wish. To gain access to the block we invoke the `call` method on the `Proc` object. The variable can be given any name and can be passed around from method to method like other objects.  No need to use the `&` symbol when referencing the `Proc` object stored in `block` as its already been converted.

```ruby
def another_method(&block)		# convert asssociated block to proc and store it in the local variable block
  block
end

greeting = another_method {puts "hi"}
=> #<Proc:0112394fff72073, (irb 4)>
greeting.call

outputs hi
=> nil
```



## `next`

1. why is it a bad idea to skip learning about `next`?

   ```ruby
   def a_method(array)
     transform_arr = []
     array.each {|i| transform_arr << yield(i) }
     transform_arr
   end
   
   a_method([1,2,3]) {|x| next(x * x) }
   => [1,4,9]
   ```

   because `next` causes a block to return to the iterator that invoked it (in this case it would be `Array#each`. ) If you pass `next` an argument it will take that argument with it as its return value. In this case `next` takes the `x` squared and pushes it into a new array `transform_arr`. Since this is the last expression in `a_method` `[1,4,9]` is returned

2. how can `next` trick me?

   because any code below the `next` keyword is ignored. The whole point of `next` is to skip the logic in a loop or block of an iterator. Also if `next` is used by itself with no arguments it returns `nil`. You just want to be careful about how you use `next` and if it makes sense to do so.

3. why would I fail if I didn't understand how `next` works? 

   `next` can be very useful with conditionals like `if` or `unless` modifiers so logic can be skipped if it doesn't fulfil some specific condition. It gives us cleaner code and can be handy when we don't want to run our value through a block or loop at all ie - great for selective purposes. It also helps speed up our iteration and increases performance. 

## `break`

1. why shouldn't I gloss over `break`?

   ```ruby
   def a_method(array)
     transform_arr = []
     for i in array
       transform_arr << yield(i)
     end
     transform_arr
   end
   
   a_method([1,2,3]) {|x| break(x * x) }
   => 1
   ```

   because `break` when used inside a block will immediately escape the iterator / loop. If it has an argument, which in this case it does, the `break` statement will take it and use it as its return value, in this case it breaks out of the block and returns the first element squared `1`

2. how can `break` fool me?

   because `break` quits the loop entirely you want to be sure you need to do that as opposed to skipping to the next iteration with `next`. And if `break` has no argument it returns `nil`  

3. why would I fail if I didn't understand how `break` works? 

   using `break` is critical to escaping an infinite `loop` structure or if you needed some specific value from an iterator and you didn't require further iteration once it was found. Be careful not to confuse it with `next` functionality as it will quit the iterator method or loop entirely.  

## `return`

1. why isn't it a good idea to skip information about `return?`

   ```ruby
   def a_method(array)
     transform_arr = []
     for i in array
       transform_arr << yield(i)
     end
     transform_arr
   end
   
   a_method([1,2,3]) {|x| return(x * x) }
   => LocalJumpError
   ```

   `return` is only used for methods and will escape the method straight away, with any arguments passed to `return` will be used as its return value. If we use a `return` keyword inside a block that wasn't inside a method it raise a `LocalJumpError`.  

2. why would I fail if I didn't understand how `return` works?

   In ruby  `return` is very useful to act as a guard clause inside a method definition.  The problem with `return` is that it will quit the method straight away and return `nil` if no argument was passed to it. You just want to be careful about where its placed in a method. If a block inside a method contains a `return` it will completely exit the method altogether.

## `yield`

1.  Why would not knowing about `yield` ruin my chances of mastering the fundamentals?

   ```ruby
   def a_method(array)
     transform_arr = []
     for i in array 
       transform_arr << yield(i)
     end
     transform_arr
   end
   
   a_method([1,2,3]) {|x| next(x * x) }
   => [1,4,9]
   ```

   `yield` is an important tool for defining custom iterators. within a `for` loop or iterative method like `each` we can send each element of a collection object (like a hash/array) to a block associated with the method (ie on the same line as the invocation). 

   This is done by passing an element as an argument via the `yield` keyword. This way the method "yields" control to the block so the block can work with it. 

   When the end of the block is reached, the method definition regains control and execution resumes on the next line following the `yield` keyword.



## block `{}` `do..end`

1. Why wouldn't I master the fundamentals of ruby if I didn't understand how blocks work?

   Blocks are powerful and unique to ruby in the sense that they are chunks of code that can be iterated over using an iterator method. They are more often used over a loop and present code more cleanly and succinctly. They're typically used by objects that represent a collection to manipulate their elements individually.

   blocks aren't allowed to standalone and must follow a method invocation. If the method isn't an iterator nor doesn't use the `yield` statement in its definition, the block will be silently ignored.

   As always the return value of the block is always the last expression evaluated. The return value of the block becomes the return value of the `yield` statement. This can be reassigned or dealt with however you wish.

   blocks have parameters that have rules that act more like variable assignment as opposed to method invocation rules. If a `yield` statement passes more arguments than what's specified in a block, the block will silently discard subsequent arguments and only assign the ones it can. If however the reverse happens where `yield` passes too fewer arguments compared to the block's parameters, they won't be assigned anything and thus return `nil`. This is known as  lenient arity, meaning that unlike methods, blocks don't complain about what arguments are passed to it.

 

## `proc`

1. Blocks like methods are not ruby objects and act like functions . It is possible however to create an object that represents a block. These are known as `Proc` objects and they are functions rather than a method invoked on an object. `Proc`s are closures - which means they retain access to local variables that we in scope when they were first defined - even if the `proc` or `lambda` was invoked in another scope. 
2. we can execute the code of a block through the `Proc` that represents it by using `Proc`s `call` method The return value of the `call` method is the return value of the last evaluated expression in the block. As an alternative you can pass arguments to the block when invoked without the `call` method and instead use the `[]` method as shown below. This is ruby's classic example of syntactic sugar.
3. Blocks can be converted into procs using the `Kernel#proc` method, using `&` in a method definition and using the `Proc.new` method which also takes a block as an argument. 
4. Procs have a defined `==` method that only returns true if two procs are the same object.

```ruby
printer = Proc.new {|word| puts word}

printer["hello"]
outputs hello
=> nil
```

```ruby
greeting = proc {|word| puts word}
  
printer.call("hello")
outputs hello
=> nil 
```

## `lambda`

1. Procs have block like behaviour whereas Lambdas have method like behaviour. Both are instances of class `Proc`. 



## `:symbol`

## `LocalJumpError`

## `arity`

1. Arity is the number of arguments a closure expects. When something has lenient arity it is said not to complain if it has too little or too many arguments than it requires. And when it has strict arity it is said to raise errors if the specified number of arguments are not met. Blocks and Procs have lenient arity and methods and lambdas have strict arity.

2. to check the arity of the block you can invoke the `#arity` on a `Proc` object.

   ```ruby
   proc { |ele, idx| ele + idx }.arity
   => 2
   ```

3. A `Proc` object can take multiple arguments with the `*` splat operator. This collapses numerous arguments into an array and assigned to a single variable inside the block

   ```ruby
   def a_method(word1, word2, word3, word4)
     yield(word1, word2, word3, word4)
   end
   
   a_method("Hi", "there", "I'm", "Karis") {|first, *rest| rest}
   => ["there", "I'm", "Karis"]
   ```

## Closures

1. Closures don't retain the value of the variables it refers to-- it retains the ACTUAL variables and extends their lifetime!! This means that variables aren't statically bound when a lambda or proc is created, instead the bindings are dynamic. and the values of the variables are LOOKED UP (like methods) when a lambda or proc is executed. So if that variable has been updated or mutated over time - the block, proc or lambda will have access to that new value the binding variable is referencing.
2. closures don't only retain variables, but also the value of `self`, any methods and the block itself.
3. You can set the value of an artifact that was used in the closure using the `binding.eval("n=3")` method.



## Method Objects: `map(&:to_s)`

1. methods and blocks are **not** objects!!!! They are executable chunks of code
2. `procs` and `lambdas` are object **versions** of blocks and methods, they can both be executed and manipulated as data.
3. Methods can actually be represented as **instances** of the `Method` class