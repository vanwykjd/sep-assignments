require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root == node
      return node
    end
    
    if node.rating > root.rating
      if root.right == nil
        root.right = node
      else
        insert(root.right, node)
      end
    elsif node.rating < root.rating
      if root.left == nil
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data != nil
      if data == root.title
        return root
      elsif root.right != nil
        find(root.right, data)
      elsif root.left != nil
        find(root.left, data)
      end
    else
      return nil
    end
  end

  def delete(root, data)
    temp = @root
    data_node = find(root, data)
    if data_node != nil
      if data_node.rating > temp.rating
        while temp.right != data_node
          if temp.right
            temp = temp.right
          else
            break
          end
        end
        unless temp.right == nil
          temp.right = temp.right.right
        end
        unless temp.left == nil
          temp.left = temp.left.left
        end
      elsif data_node.rating < temp.rating
        while temp.left != data_node
          if temp.left
            temp = temp.left
          else
            break
          end
        end
        unless temp.left == nil
          temp.left = temp.left.left
        end
        unless temp.right == nil
          temp.right = temp.right.right
        end
      end
    else 
      return nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    node = @root
    results = []
    child_nodes = []
    return nil if node.nil?
    child_nodes << node
    while !child_nodes.empty?
      next_node = child_nodes.shift
      results << next_node.title + ": " + next_node.rating.to_s
      if !next_node.left.nil?
        child_nodes << next_node.left
      end
      if !next_node.right.nil?
        child_nodes << next_node.right
      end
    end
      puts results.join("\n")
    end
end