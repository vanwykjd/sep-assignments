require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if empty?
      @head = node
      @tail = node
    else 
      temp = @head
      while temp.next != nil
        temp = temp.next
      end
      temp.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    temp = @head
    if @head == @tail
       @tail = nil
       @head = nil
    else
      while temp.next != @tail
        temp = temp.next
      end
      temp.next = temp.next.next
      @tail = temp
    end
  end

  # This method prints out a representation of the list.
  def print
    nodes = []
    if empty?
      puts "Nothing has been added to list to print."
    else
      temp = @head
      while temp.next != nil
        nodes << temp.data
        temp = temp.next
      end
      nodes << temp.data
      puts nodes 
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if empty?
      puts "Nothing has been added to list to delete."
    else
      temp = @head
      if @head == node
        remove_front
      elsif @tail == node
        remove_tail
      else
        while temp.next != node
          if temp.next
            temp = temp.next
          else 
            puts "Node does not exist in list"
            break
          end
        end
        unless temp.next == nil
          temp.next = temp.next.next
        end
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if empty?
      @head = node
      @tail = node
    else 
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head
    if @head == @tail
       @head = nil
       @tail = nil
    else
      temp = temp.next
      @head = temp
    end
  end

  def empty?
    @head && @tail ? false : true
  end
end

