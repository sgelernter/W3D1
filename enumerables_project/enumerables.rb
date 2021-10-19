
#require "byebug"
class Array 

    def my_each(&prc)
        i = 0
        while i < self.length 
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        results_array = []
        self.my_each do |ele|
            results_array << ele if prc.call(ele)
        end
        results_array
    end

    def my_reject(&prc)
        results_array = []
        self.my_each do |ele|
            results_array << ele if !prc.call(ele)
        end
        results_array
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end

        false
    end

     def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end

        true
    end

    def my_flatten

        flattened = []
        self.each.with_index do |ele, i|
            if !ele.is_a?(Array)
                flattened << ele  
            else   
                flattened += ele.my_flatten
            end
        end
        flattened
    end

    def my_zip(*args)
        zip_size = args.length + 1
        matrix = Array.new(self.length) {Array.new(zip_size, nil)}
        args.unshift(self)

        args.each.with_index do |row, i|
            row.each.with_index do |ele, j|
                matrix[j][i] = ele
            end
        end
        matrix
    end

    def my_rotate(num = 1)
        if num > 0
            num.times do 
                back = self.shift
                self.push(back)
            end
        else
            (num * -1).times do
                front = self.pop
                self.unshift(front)
            end
        end
        self
    end

    def my_join(str = "")
        joined = ""
        self.each { |ele| joined += "#{ele}#{str}" }
        if str != ""
            return joined[0...-1]
        else
            return joined
        end
<<<<<<< HEAD
=======

>>>>>>> 8b066bed7f317147e72c12d9c72256779651b99a
    end

    def my_reverse
        reversed = []
<<<<<<< HEAD
        (1..self.length).each do |i|
            reversed << self[-i]
        end
        reversed
    end

    def factors(num)
        result = []
        (1..num).each do |i|
            if num % i == 0
                result << i
            end
        end
        result
    end

    def bubble_sort(&prc)
        sorted = false
        while !sorted 
            sorted = true 
            (0...self.length - 1).each do |i|
                if prc.call(self[i]) > prc.call(self[i+1])
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        self
=======

        (1..self.length).each do |i|
            reversed << self[-i]
        end

        reversed
>>>>>>> 8b066bed7f317147e72c12d9c72256779651b99a
    end

end

<<<<<<< HEAD

=======
# p a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
>>>>>>> 8b066bed7f317147e72c12d9c72256779651b99a
