
$LOAD_PATH << '.'
require 'word_list.rb'

$alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")

$game_board = [
    Array.new(5, "\e[107m ☐ \e[0m").join,
    Array.new(5, "\e[107m ☐ \e[0m").join,
    Array.new(5, "\e[107m ☐ \e[0m").join,
    Array.new(5, "\e[107m ☐ \e[0m").join,
    Array.new(5, "\e[107m ☐ \e[0m").join
    ]

$line = Array.new(16, "=").join("")

class Methods

    def self.random_word_sampler
        random_word = $word_array.sample.upcase.split("")
        
        (random_word.length).times do |i|
            random_word[i] =  " #{random_word[i]} "
        end

        return random_word

    end


    def self.input_and_convert
        print " "

        input = gets.chomp.upcase.split("").first(5)
        
        (input.length).times do |i|
            input[i] =  " #{input[i]} "
        end

        return input

    end

    def self.alphabet_formatter (alphabet) # split alphabet into array and format each letter

        (alphabet.length).times do |i|
            alphabet[i] = " #{alphabet[i]} "
        end

        return alphabet

    end

    def self.show_alphabet (alphabet)

        # final_letter_array = []

        puts alphabet.take(9).join

        puts alphabet.drop(9).take(8).join

        puts alphabet.drop(17).join


        # final_letter_array.push(row_one, row_two, row_three)

        # puts $line
        # puts final_letter_array.join("")
        # puts $line

    end

    def self.reset_alphabet

        $alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")

    end


    def self.checker_and_color(input,random_word,alphabet) # Takes 3 ARGS, Also coloring the alphabet
    
        i = 0
    
        while(i<input.length)

            alpha_index = !alphabet.index(input[i]).nil? ? alphabet.index(input[i]) : nil # Gets location of letter in the alphabet

            # if (alphabet.include?(input[i]))
            #     alphabet.delete(input[i])
            # end

            if(random_word.include?(input[i]) && input[i] == random_word[i]) #Green
                input[i] = "\e[102m#{input[i]}\e[0m"
                if alpha_index != nil
                    alphabet[alpha_index] = "\e[102m#{alphabet[alpha_index]}\e[0m"
                end
                i += 1

            elsif (random_word.include?(input[i]) && input[i] != random_word[i]) #Yellow
                input[i] = "\e[103m#{input[i]}\e[0m"
                if alpha_index != nil
                    alphabet[alpha_index] = "\e[103m#{alphabet[alpha_index]}\e[0m"
                end
                i += 1

            else
                input[i] = "\e[100m#{input[i]}\e[0m"
                if alpha_index != nil
                    alphabet[alpha_index] = "\e[100m#{alphabet[alpha_index]}\e[0m"
                end
                i += 1
            end

        end

        return input

    end

    def self.win_check(guess,random_word)
        
        if guess.join("") == random_word.join("")
            
            return true
            
        end

    end

    def self.win_text(boolean)
        if boolean == true
            puts
            puts " Well done you win! "
            Game.play_again?
        end
    end

    def self.reset_board
        $game_board = [
            Array.new(5, "\e[107m ☐ \e[0m").join,
            Array.new(5, "\e[107m ☐ \e[0m").join,
            Array.new(5, "\e[107m ☐ \e[0m").join,
            Array.new(5, "\e[107m ☐ \e[0m").join,
            Array.new(5, "\e[107m ☐ \e[0m").join
        ]
    end

    
end

class Game

    


    def self.type (string)
        
        string.each_char do |c|
            print c
            sleep 0.02
        end
    end

    def self.intro
        
        puts; puts; puts;

        type " Welcome to wordle"; puts;

        sleep 0.8

        puts $line;

        puts $game_board

        puts $line

        sleep 0.8

        type " Start by typing out your first 5 letter word"

        puts
        
    end

    def self.play_again?

        puts; puts $line; puts;
        
        puts "Would you like to play again? Type 'y' or 'n'"; print " "
        
        input = gets.chomp.downcase
        
        if input == "y"
            puts; puts $line; puts;
            type " Great!"; puts; puts;
            type " Type your first word"; puts; puts;
            
            Methods.reset_board
            Methods.reset_alphabet
            
            Game.play_game
        elsif input == 'n'
            puts "Thanks for playing!"
            exit
        else
            puts "Invalid input"
            Game.play_again?
        end
    end

    def self.play_game

        alphabet = Methods.alphabet_formatter($alphabet)

        random_word = Methods.random_word_sampler
    
        5.times do |i|

            first_input = Methods.input_and_convert # Getting user input
            
            is_win = Methods.win_check(first_input,random_word) # Creating boolean value if win or not
            
            input_checked = Methods.checker_and_color(first_input,random_word,alphabet) # Checking and coloring the user guess
    
            $game_board[i] = input_checked.join("") # Replacing the current game board array with the guess

            puts $game_board # Displaying the board 

            puts $line ; puts; sleep 0.5

            puts "Guess another word"

            puts Methods.show_alphabet(alphabet)

            Methods.win_text(is_win) # If is_win is true, execute methods function

        end

        puts
        puts " Sorry you lose, The word was "
        puts
        puts " #{random_word.join.delete(" ")}"

        Game.play_again?

    end

end


Game.intro
Game.play_game


=begin

Game Flow

$GameBoard
    $game_board = [
        Array.new(5, "\e[107m ☐ \e[0m").join,
        Array.new(5, "\e[107m ☐ \e[0m").join,
        Array.new(5, "\e[107m ☐ \e[0m").join,
        Array.new(5, "\e[107m ☐ \e[0m").join,
        Array.new(5, "\e[107m ☐ \e[0m").join
        ]
$word array
    random_word = [
        "Brute",
        "Abuse",
        "Unpin",
        "Grass",
        "Grain"
    ].sample.upcase.split("") 

Game intro

Start Game()
    
    Get Random Word()
     Method sample global array
     Convert to formatting
        
    Game Loop

        Get User Input & Convert to format ()
           Method
           word = gets.chomp.upcase.split("")
           Each loop to add spaces
           return word

         Do Win Check (user input, random word) [set this to a variable i.e is_win = win_check]
           Method, check if input equals random word
           Return true

         Check & Color User Input Random Word (user input return)
           Method 
           Check positions & color
           return checked and colored word
        
         Update Game Board (check & color return)
           Method
           Take check & color input then modify array
         
         Show game board
          
         Check if winner (Take check and color user Input)
           check is_win variable
           if is_win equals true
            user wins game
                
      If loop finishes without winning
        Return You lost sorry, exit code
            
        
=end






