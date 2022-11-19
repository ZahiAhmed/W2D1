# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array
    #PART1
    def span
        return nil if self.length < 1
        large = 0
        small = self[0]
        self.each do |ele|
            large = ele if ele > large
            small = ele if ele < small
        end
        large - small
    end

    def average
        return nil if self.length == 0
        self.sum/self.length.to_f
    end

    def median
        return nil if self.length < 1
        if self.length % 2 == 1
            return self.sort[self.length/2]
        else 
            return (self.sort[self.length/2] + self.sort[self.length/2 - 1]) / 2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end

    def my_count(value)
        self.select{|ele| ele == value}.length
    end

    def my_index(value)
        self.each.with_index{|ele, i| return i if value == ele}
        return nil
    end

    def my_uniq
        self.counts.keys
    end

    def my_transpose
        #debugger
        new_array = Array.new(self.length){Array.new(self.length)}
        self.each.with_index do |array, i|
            array.each.with_index{|ele, j| new_array[j][i] = ele}
        end
        new_array
    end
end
