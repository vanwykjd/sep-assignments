
include RSpec
require_relative 'heap_tree'

RSpec.describe MinHeap, type: Class do
  let (:root) { HeapNode.new("The Matrix", 87) }
  let (:min_heap) { MinHeap.new(root) }
  
  let (:pacific_rim) { HeapNode.new("Pacific Rim", 72) }
  let (:braveheart) { HeapNode.new("Braveheart", 78) }
  let (:jedi) { HeapNode.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { HeapNode.new("Donnie Darko", 85) }
  let (:inception) { HeapNode.new("Inception", 86) }
  let (:district) { HeapNode.new("District 9", 90) }
  let (:shawshank) { HeapNode.new("The Shawshank Redemption", 91) }
  let (:martian) { HeapNode.new("The Martian", 92) }
  let (:hope) { HeapNode.new("Star Wars: A New Hope", 93) }
  let (:empire) { HeapNode.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { HeapNode.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts new node as root" do
      min_heap.insert(root, nil)
      expect(min_heap.node_list[1].title).to eq "The Matrix"
    end

    it "properly inserts a new node to become new root" do
      min_heap.insert(root, pacific_rim)
      expect(min_heap.node_list[1].title).to eq "Pacific Rim"
      expect(min_heap.node_list[1].left.title).to eq "The Matrix"
    end
    
    it "properly inserts a new node and sorts for new left child and new right child" do
      min_heap.insert(root, pacific_rim)
      min_heap.insert(root, braveheart)
      expect(min_heap.node_list[1].title).to eq "Pacific Rim"
      expect(min_heap.node_list[1].left.title).to eq "Braveheart"
      expect(min_heap.node_list[1].right.title).to eq "The Matrix"
    end
    
    it "properly inserts a new node and sorts for new left-left child" do
      min_heap.insert(root, pacific_rim)
      min_heap.insert(root, braveheart)
      min_heap.insert(root, jedi)
      expect(min_heap.node_list[1].left.left.title).to eq "The Matrix"
    end
    
    it "properly inserts a new node and sorts for new left-right child" do
      min_heap.insert(root, pacific_rim)
      min_heap.insert(root, braveheart)
      min_heap.insert(root, jedi)
      min_heap.insert(root, donnie)
      expect(min_heap.node_list[1].left.left.title).to eq "Donnie Darko"
      expect(min_heap.node_list[1].left.right.title).to eq "The Matrix"
    end
    
    it "properly inserts a new node and sorts for new right-left child" do
      min_heap.insert(root, pacific_rim)
      min_heap.insert(root, braveheart)
      min_heap.insert(root, jedi)
      min_heap.insert(root, donnie)
      min_heap.insert(root, district)
      expect(min_heap.node_list[1].right.left.title).to eq "District 9"
    end
    
    it "properly inserts a new node and sorts for new right-right child" do
      min_heap.insert(root, pacific_rim)
      min_heap.insert(root, braveheart)
      min_heap.insert(root, jedi)
      min_heap.insert(root, donnie)
      min_heap.insert(root, district)
      min_heap.insert(root, martian)
      expect(min_heap.node_list[1].right.right.title).to eq "The Martian"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      min_heap.insert(root, empire)
      min_heap.insert(root, mad_max_2)
      expect(min_heap.find(root, nil)).to eq nil
    end
    
    it "properly finds new root node" do
      min_heap.insert(root, pacific_rim)
      expect(min_heap.find(root, pacific_rim.title).title).to eq "Pacific Rim"
    end
    
    it "properly finds a left node" do
      min_heap.insert(root, empire)
      expect(min_heap.find(root, empire.title).title).to eq "Star Wars: The Empire Strikes Back"
      expect(min_heap.find(root, empire.title).rating).to eq 94
    end
    
    it "properly finds a right node" do
      min_heap.insert(root, empire)
      min_heap.insert(root, mad_max_2)
      expect(min_heap.node_list[2].title).to eq "Star Wars: The Empire Strikes Back"
      expect(min_heap.node_list[2].rating).to eq 94
      expect(min_heap.find(root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
      expect(min_heap.find(root, mad_max_2.title).rating).to eq 98
    end
    
    it "properly finds a left-left node" do
      min_heap.insert(root, pacific_rim)
      min_heap.insert(root, braveheart)
      min_heap.insert(root, jedi)
      min_heap.insert(root, donnie)
      expect((min_heap.find(root, braveheart.title).left).title).to eq "Donnie Darko"
    end
    
    it "properly finds a left-right node" do
      min_heap.insert(root, pacific_rim)
      min_heap.insert(root, braveheart)
      min_heap.insert(root, jedi)
      min_heap.insert(root, donnie)
      expect((min_heap.find(root, braveheart.title).right).title).to eq  "The Matrix"
    end
    
  end
  
  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(min_heap.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      min_heap.insert(root, hope)
      min_heap.delete(root, hope.title)
      expect(min_heap.find(root, hope.title)).to be_nil
    end

    it "properly deletes a new root node" do
      min_heap.insert(root, nil)
      min_heap.insert(root, braveheart)
      min_heap.insert(root, pacific_rim)
      min_heap.delete(root, pacific_rim.title)
      expect(min_heap.find(root, pacific_rim.title)).to be_nil
    end

    it "properly deletes a right node" do
      min_heap.insert(root, donnie)
      min_heap.insert(root, inception)
      min_heap.delete(root, inception.title)
      expect(min_heap.find(root, inception.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      min_heap.insert(root, hope)
      min_heap.insert(root, martian)
      min_heap.delete(root, martian.title)
      expect(min_heap.find(root, martian.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      min_heap.insert(root, pacific_rim)
      min_heap.insert(root, braveheart)
      min_heap.insert(root, jedi)
      min_heap.insert(root, donnie)
      min_heap.delete(root, donnie.title)
      expect(min_heap.find(root, donnie.title)).to be_nil
    end
  end
  describe "#printf" do
     specify {
       expected_output = "The Matrix: 87\nStar Wars: Return of the Jedi: 80\nStar Wars: A New Hope: 93\nPacific Rim: 72\nInception: 86\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nBraveheart: 78\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\nDistrict 9: 90\n"
       min_heap.insert(root, hope)
       min_heap.insert(root, empire)
       min_heap.insert(root, jedi)
       min_heap.insert(root, martian)
       min_heap.insert(root, pacific_rim)
       min_heap.insert(root, inception)
       min_heap.insert(root, braveheart)
       min_heap.insert(root, shawshank)
       min_heap.insert(root, district)
       min_heap.insert(root, mad_max_2)
       expect { min_heap.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "The Matrix: 87\nBraveheart: 78\nMad Max 2: The Road Warrior: 98\nPacific Rim: 72\nInception: 86\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
       min_heap.insert(root, mad_max_2)
       min_heap.insert(root, district)
       min_heap.insert(root, shawshank)
       min_heap.insert(root, braveheart)
       min_heap.insert(root, inception)
       min_heap.insert(root, pacific_rim)
       min_heap.insert(root, martian)
       min_heap.insert(root, jedi)
       min_heap.insert(root, empire)
       min_heap.insert(root, hope)
       expect { min_heap.printf }.to output(expected_output).to_stdout
     }
  end

  
end