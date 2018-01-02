class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    node = @head.next
    while node != @tail
      return node.val if node.key == key
      node = node.next
    end
    nil
  end

  def include?(key)
    node_pointer = first
    while node_pointer != @tail
      if node_pointer.key == key
        return true
      end
      node_pointer = node_pointer.next
    end
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.next = @tail
    last.next = node
    node.prev = last
    @tail.prev = node
  end

  def update(key, val)
    #if include?(key)
    each do |node|
      if node.key == key
        node.val = val
      end
    end

      # while node_pointer != @tail
      #   if node_pointer.key == key
      #     node_pointer.val = val
      #   end
      #   node_pointer = node_pointer.next
      # end
    #else
    #  raise "Not a node"
  #  end
  end

  def remove(key)
    #if include?(key)
    each do |node|
      if node.key == key
        node.remove
      end
    end
    #else
    #  raise "Not a node"
  #  end
  end

  def each(&prc)
    node = first
    until node == @tail
      prc.call(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
