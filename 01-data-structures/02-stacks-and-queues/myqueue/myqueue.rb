class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def enqueue(element)
    @queue << element
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def dequeue
    temp = @head
    @queue.delete_at(0)
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
    temp
  end

  def empty?
    @head == nil ? true : false
  end
end