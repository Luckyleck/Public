### Door game
# TO DO MAKE DOOR SHUFFLER 
### Assets

$name = ''
$player_number = rand(20..100)
$line = Array.new(65, "=").join("")

# Text

$failed = "Wrong door #{$name}. You lose.\nJust as I expected.\nGoodbye!"
$continue_ask = "Shall we continue? Type 'yes' or 'no'"
$door_ask = "Which door would you like to go through #{$name}? You have 1 chance."
$type_assist = "Type the color of the door."
$fake_doors = " -=[GREEN]=[BLUE]=[RED]=[BLACK]=- "
$dont_continue = "Ahh cold feet, I understand. Play again soon!"
$win_text = "Nice job! You chose the right door!"


$num_array = []

# Methods


def get_input
    gets.chomp.to_s.downcase
end

def name_asker
    $name = get_input.capitalize
end

def ready_to_play
    puts; puts "Are you ready to play? Type 'yes' or 'no'"; puts $line;
    ready = get_input
    if ready != "yes"
        puts $line; puts "Oh, you're not ready yet. Okay, comeback when you are.";
        exit
    else
        puts $line; puts "Great, lets do it!"; sleep 2; puts;
        puts "Before you are 4 doors, consider this round one"
    end
end

def strength_ask
    puts "Would you like to know your strength? Type 'yes' or 'no'"
    puts $line
    answer = get_input
    puts $line

    if answer == "yes"
        puts "Your strength is #{$player_number}"
    else
        puts "Ooo you like suprises. Even better"
    end
end

def begin_game # opening script
    puts $line; puts $line; puts $line;
    puts "Hello! Welcome to '4 for 4'.\nmade by insanopatato\n\nWhat's your name?"
    puts $line
    name_asker()
    puts $line
    sleep 1
    puts "Hello " << $name << "!" ; sleep 1 ; puts ;
    puts "In this game you will test your luck 4 times."
    sleep 1
    puts "By luck I mean your randomly generated strength..." ; sleep 3;
    puts
    puts "In this game there are 4 doors.\nEach with varying strengths"; sleep 2;
    puts
    puts "You must choose a door to go through."
    puts "If you're strong enough, the door will open."
    puts ; sleep 3;
    puts "If you aren't... You will lose and be taken away by the FBI like Jonathan"; sleep 3
    puts
    strength_ask
    ready_to_play
end

def end_game # eng game script
    puts $line
    puts "Whaa... " ; sleep 1;
    puts "No way... \nThis is impossible" ; sleep 2;
    puts "You shouldn't have won. It was rigged against you 😠" ; sleep 2;
    puts "Well.. I suppose you've won." ; sleep 2;
    puts "Well done! Thanks for playing"
    puts
    puts "Stats: \nYour strength was #{$player_number}"
    puts "The door you went through chose were #{$num_array} " ;puts ; puts $line;
end

def door_display
    puts
    door_array = ["GREEN", "BLUE", "RED", "BLACK"]
    door_array.shuffle!
    doors_string = door_array.join("]=[")
    puts "-=[" << doors_string << "]=-"
    puts; puts $line; sleep 1;
    puts $door_ask;
    puts $type_assist; puts;
end

def checker (color_num) # checks if players number is greater than the doors number
    if $player_number < color_num
        puts $line; puts $failed # show fail message 
        puts "Your strength was : #{$player_number}. Door strength was #{$num_array.last}"
        exit # end game 
    end
end

def continue? # asking to continue playing after each round
    puts $continue_ask
    continue = get_input
    if continue != "yes"
        puts $dont_continue
        exit
    end
end

def door_picker (color)
    # Gen Random Numbers
    doors = Hash.new
    doors["green"] = rand(0..99)
    doors["blue"] = rand(0..99)
    doors["red"] = rand(0..99)
    doors["black"] = rand(0..99)

    $num_array.push([color, doors[color]]) # Store number
    
    guess = doors[color] # Number of door
    checker(guess) # Check if player num is greater than door num
    sleep 1
end

def player_color # get's players color
    get_input # asking for response
end

def round_win # if player wins
    puts $line; puts $win_text ; puts;
end

def play_round
    puts $line
    door_display()
    color = player_color() # Finding color
    door_picker(color) #includes check
    round_win()
end

# Game script

begin_game

play_round
continue?
play_round
continue?
play_round
continue?
play_round

end_game





