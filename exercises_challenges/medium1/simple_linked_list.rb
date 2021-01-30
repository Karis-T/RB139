=begin

linked list:

[element1, element2, element3]

{nil <= 1}, {to1 <= 2} {to2 <= 3}
=end

class SimpleLinkedList
  attr_accessor :list

  def initialize
    @list = []
  end

  def size
    list.length
  end

  def empty?
    list.empty?
  end

  def push(n)
    if empty?
      list << Element.new(n)
    else
      list << Element.new(n, list.last)
    end
  end

  def head
    list.last
  end

  def pop
    list.pop.datum
  end

  def peek
    return nil if empty?
    head.datum
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def self.from_a(arr)
    new_list = SimpleLinkedList.new
    return new_list if arr.nil? || arr.empty?
    arr.reverse_each { |n| new_list.push(n) }
    new_list
  end

  def to_a
    list.map(&:datum).reverse
  end
end

class Element
  attr_accessor :next, :datum

  def initialize(data, pointer=nil)
    @next = pointer
    @datum = data
  end

  def tail?
    @next.nil?
  end
end
