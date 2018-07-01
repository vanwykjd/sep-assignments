
include RSpec
require_relative 'heap_tree'

RSpec.describe MinHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }
  let (:min_heap) { MinHeap.new(root) }
  
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a root" do
      min_heap.insert(root, pacific_rim)
      expect(pacific_rim.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node" do
      min_heap.insert(root, braveheart)
      expect(pacific_rim.left.title).to eq "Braveheart"
      expect(pacific_rim.right.title).to eq "The Matrix"

      min_heap.insert(root, jedi)
      expect(pacific_rim.right.title).to eq "Star Wars: Return of the Jedi"
      expect(pacific_rim.left.left.title).to eq "The Matrix"
    end
  end

  describe "#find(data)" do
    it "properly finds a node" do
      min_heap.insert(root, donnie)
      expect(min_heap.find(pacific_rim.title)).to eq pacific_rim
      expect(min_heap.find(braveheart.title)).to eq braveheart
    end
  end

  
end