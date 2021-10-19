require_relative "./dictionary.rb"
require_relative "./player.rb"
require "byebug"

class Game

    def initialize(num_players)
        @num_players = num_players
        @players = []
        @fragment = ""
        @dictionary = Dictionary.new.word_set
    end

    attr_accessor :players, :fragment
    attr_reader :dictionary, :num_players

    def get_players
        while @players.length < @num_players
            puts "Enter the next player's name: "
            name = gets.chomp
            @players << Player.new(name)
        end
    end

    def current_player
        @players[0]
    end

    def previous_player
        @players.last
    end

    def next_player!
        @players.rotate!
    end

    def print_fragment
        print "the current fragment is '#{@fragment}'\n"
    end

    def take_turn
        guess = self.current_player.guess

        while !self.valid_play?(guess)
            puts "Sorry, that's not a valid entry--try again: "
            guess = current_player.guess
        end
        @fragment += guess
        self.print_fragment
        
        if self.valid_word?(@fragment)
            puts "That's a word--#{current_player.name} loses!"
            return true
        end
        self.next_player!
        false
    end

    def valid_play?(str)
        alphabet = ("a".."z").to_a
        if alphabet.include?(str)
            @dictionary.each do |word|
                if word.start_with?(@fragment + str)
                    return true
                end
            end
        end
        false
    end

    def valid_word?(str)
        return true if @dictionary.include?(str)
    end

    def play_game
        self.get_players
        until self.take_turn == true
            self.take_turn
        end
    end


end

game = Game.new(2)
game.play_game
