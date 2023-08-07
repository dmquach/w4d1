require "byebug"
class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    attr_reader :value, :parent, :children

    def parent=(node) # instance of node
        old_parent = @parent
        old_parent.children.delete(self) if !old_parent.nil?
        @parent = node
        node.children << self if !node.nil? && !node.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "This isn't a child!" if !@children.include?(child_node)
        child_node.parent = nil # this automatically alters the parent AND child
    end

    def inspect
        puts "Value: #{@value} Parent: #{@parent.value} Children: #{@children}"
    end

    def dfs(target_value)
        return self if @value == target_value
        # return nil if target_value != @value && @children.empty?

        @children.each do |child|
            res = child.dfs(target_value)
            return res if !res.nil?
        end
        nil
    end

    def bfs(target_value)
        # create local array
        queue = []

        # insert current node (self)
        queue << self

        while !queue.empty?
            # check first ele of array
            first_ele = queue.shift # removes first ele
            return first_ele if first_ele.value == target_value
            queue += first_ele.children
        end

        nil
    end

end
