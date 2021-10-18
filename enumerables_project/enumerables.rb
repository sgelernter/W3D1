
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

        #return [ele] if !ele.is_a?(Array)
        #[1,2,[3]]
        flattened = []
        self.each.with_index do |ele, i|
          
            if !ele.is_a?(Array)
                flattened << ele  
            else   
                  #debugger
                flattened += ele.my_flatten
            end

        end


        flattened
    end

    #[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
end

 p [1,2,[3]].my_flatten
 p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten