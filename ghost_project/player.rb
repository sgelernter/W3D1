class Player

    def initialize(name)
        @name = name
    end

    attr_reader :name

    def guess
        print "#{self.name}, it's your turn to add a letter: "
        return gets.chomp
    end


end