require_relative 'node'

class MinHeap

  def initialize(root)
    @node_list = [nil]
    insert(root, nil)
  end

  def insert(root, data)
    if data == nil
      @node_list << root
    elsif root == data
      return data
    else
      @root = @node_list[1]
      @node_list << data
      if root.rating < @root.rating
        swap(root, @root)
        insert(@root, data)
      elsif data.rating < root.rating
        swap(data, root)
      end
      assign_children
    end
  end

  

  # Recursive Depth First Search
  def find(root, data)
    if data != nil
      if data == root.title
        return root
      else
        i = 1
        while i < @node_list.length
          if @node_list[i].title == data
            return @node_list[i]
            break
          end
          i += 1
        end
      end
    else
      return nil
    end
  end

  def delete(root, data)
    data_node = find(root, data)
    if data_node != nil
      index = @node_list.index(data_node)
      @node_list.delete_at(index)
      assign_children
    else
      return nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    node = @root
    return nil if node.nil? 
    i = 1
    while i <= @node_list.length - 1
      node = @node_list[i]
      p "#{node.title}: #{node.rating}"
      i += 1
    end
   
  end

  private

  def swap(current, target)
    current_index = @node_list.index(current)
    target_index = @node_list.index(target)
    @node_list[target_index] = current
    @node_list[current_index] = target
  end
  

  def assign_children
    i = 1
    left = i * 2
    right = (i * 2) + 1
    while right <= @node_list.length 
      left = i * 2
      right = (i * 2) + 1
      temp = @node_list[i]
      temp.left = @node_list[left]
      temp.right = @node_list[right]
      i += 1
    end
    @root = @node_list[1]
  end
end