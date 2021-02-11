# Packaging Ruby Projects

## 1. Ruby Version Managers

- **Ruby Version Managers** help you install, manage and use multiple versions of Ruby. This includes the various gems that are install for each ruby.
- **Ruby Version Managers** are useful when we have (older) programs that require specific versions of ruby and the gems it uses. It allows us to install and run a different version of ruby without having to remove our current ruby.  
- The 2 most widely used **Ruby Version Managers** are `rvm` and `rbenv`. `rvm` has more features whilst `rbenv` plugins provide more functionality.

## 2. Gems

- **Gems** are packages of code that can be downloaded and installed in your own ruby programs (using `require`) or independently run from the command line (eg `bundle`). **Gems** are typically used as the distribution mechanism for releasing your own ruby projects and for downloading others.

- While gem use is optional, gems are often quite useful when programming with ruby (eg. using `pry` for debugging and `minitest` for unit testing)

  

## 3. Bundler

- **Bundler** is a gem that helps you manage all the dependencies in a ruby project.
- **Bundler** is useful when we need to distribute our program to other systems. It installs all the necessary parts and also makes sure the program runs the correct version of ruby and its gems.

### 3a. `Gemfile`

- Bundler relies on a `Gemfile` which is the configuration or instruction file that tells Bundler which version of Ruby and gems it needs to use your application.
- A`Gemfile` is useful because it shows all the dependencies in your project and indicates to other developers how to run your project.
- A `Gemfile` usually needs 4 pieces of information:
  1. Where should bundler look for gems it needs for installation?
     - Most projects locate gems from the official site: `https://rubygems.org`
  2. Do you require a `.gemspec` file?
     - The `.gemspec` file provides all the information about a Gem. If you decide to release a program or library as a Gem, you must include a `.gemspec` file. Bundler checks for a `.gemspec` file when the `Gemfile` contains a `gemspec` statement
  3. Which Ruby version does your program require? (optional but recommended)
     - Your program should support newest versions but this isn't always possible: some users may require older versions. 
  4. What Gems does your program use?
     - looking at the `require` statements in your program doesn't always tell you all the gems needed to run your program. You may have to  search gem directories to figure out which gem is used.

### 3b. `Gemfile.lock`

- by running `bundle install` in the terminal, Bundler creates `Gemfile.lock`, which contains all your projects dependency information.
- add `require bundle/setup` to the beginning of your project before any other gem to ensure all gems that your project depends on is loaded.

### 3c. `bundle exec`

- Various gems like `rake`  are the main reason `bundle exec` is used. Any Gem command that relies on other Gems could load one that may conflict with your own project's dependencies.
- To combat this issue we use the `bundle exec` command which allows almost any other command to be run in an environment that will comply with your project's `Gemfile.lock` file and version info.

## 4. Rake

- The gem **Rake** Automates common repetitive tasks that are used to build databases, run tests, and package or install programs.
- We can use **Rake** to automate anything we want during a programs development, testing and release cycles.
- `bundle exec rake -T` displays a list of all tasks associated with your `Rakefile`. 

### 4a. `Rakefile`

- Rake uses a `Rakefile` that describes the kind of tasks can be performed for your project and how to perform them. 

## 5.`.gemspec`

- The `.gemspec` file provides all information about a Gem. 
- If you decide to release a program or library as a Gem, you must include a `.gemspec` file.
- Bundler checks for a `.gemspec` file when the `Gemfile` contains a `gemspec` statement