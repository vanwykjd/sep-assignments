class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    self.top = @stack[@stack.length - 1]
  end

  def pop
    temp = self.top
    @stack.delete_at(@stack.length - 1)
    self.top = @stack[@stack.length - 1]
    temp
  end

  def empty?
    self.top == nil ? true : false 
  end
end