# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

=begin
- behaves more like a block, lenient arity
- proc instantiates a simple proc object from the Proc class
- this particular block takes an argument and without one passed into #call it references nil
=end

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin
- lambdas are also Proc objects instantiated from the Proc class
- unlike blocks and simple procs, lambdas more like methods in their arity rules, that is it cares about the number of arguments matching the parameters
- Lambda class does not exist - lambdas are instantiated from the Proc class.
=end

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

=begin
- methods are similar to lambdas in the sense that if a method expects an argument (implicit or explicit) you must pass it an argument otherwise it will raise an error (strict arity)
- if no block is passed into the method at invocation and it contains a yield keyword in its implementation, it will raise a LocalJumpError.
- If a method is designed to take a block, it should wrap a conditional around yield and only exectute it if block_given?. This retains the option of passing or not passing a block.
=end

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
- whilst blocks are closures and retain references to all surrounding artifacts, animal is a local variable scoped at the method defintion level and is not available to the scope of the block.
- animal has to be assigned to a block parameter to be referenced inside the block otherwise it will raise an error.
=end

=begin
final analysis:
blocks, procs and lambdas are all closures that have an associated block but behave in different ways, especially when it comes to arity. Procs behave similar to blocks and have lenient arity whilst lambdas, which is also a Proc object has more strict arity, similar to method defintion. It's imporatant to note that while blocks do retain references to all surrounding artifacts, this doesn't include artifacts that are inaccessible- eg local variables scoped at the method definition level. Methods, like lambdas, care about the number of arguments passed in even if the argument is an implict block.
=end
