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

end