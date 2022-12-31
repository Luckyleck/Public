### Sky Fall Game

# Assets
# 🟦🟪🟥⬜

$left = "🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜\n🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜\n🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜\n🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜"
$middle = "⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜\n⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜\n⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜\n⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜"
$right = "⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥\n⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥\n⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥\n⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥"


$guy_left = "⬜⬜🟪⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜\n⬜🟦🟦🟦⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜\n⬜⬜🟦⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜\n⬜🟦⬜🟦⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜"
$guy_mid = "⬜⬜⬜⬜⬜⬜⬜🟪⬜⬜⬜⬜⬜⬜⬜\n⬜⬜⬜⬜⬜⬜🟦🟦🟦⬜⬜⬜⬜⬜⬜\n⬜⬜⬜⬜⬜⬜⬜🟦⬜⬜⬜⬜⬜⬜⬜\n⬜⬜⬜⬜⬜⬜🟦⬜🟦⬜⬜⬜⬜⬜⬜"
$guy_right = "⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟪⬜⬜\n⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟦🟦🟦⬜\n⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟦⬜⬜\n⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟦⬜🟦⬜"

$line = Array.new(65, "=").join("")

$clouds = [$left, $middle, $left, $right, $middle, $right]
$dudes = [$guy_left, $guy_mid, $guy_right]

$high_score = 0
$current_score = 0

# Methods

def type (text,speed = 0.032)
    text.each_char do |c|
      print c
      sleep(speed)
    end
end

def ready?
    print " "
    ready = gets.chomp.to_s.downcase
    if ready == 'y'
        sleep 0.5
        type $line,0.001; puts;
        type " Great..." ; sleep 0.2
        type " let's begin!"
        puts; sleep 0.5
    elsif ready == 'n'
        sleep 0.5
        type $line,0.001; puts;
        type " Okay..." ; sleep 0.2
        type " See you later!"
        exit
    else
        type " Invalid input, please try again"; puts;
        ready?()
    end
end

# Opening text

def begin_text
    type $line,0.001; puts;
    type $line,0.001; puts;
    type " Welcome to Sky-Fall",0.05; sleep 0.2
    type "                        Made by insanopatato"; puts; sleep 0.2;
    type $line,0.0005; puts; 
    type $line,0.0005; puts; sleep 0.5;
    type " This game is a very simple one."; sleep 0.5 ; puts; puts;
    type " The goal is to not get hit by the red..."; puts;
    type " hellish cloud at the end of the round"; sleep 0.5; puts; puts;
    type " You choose a position each time and"; puts;
    type " hope you're in the clear."; sleep 0.8; puts;puts;puts; 
    type " Are you ready to play? Type 'y' or 'n'"; puts;
    type $line,0.0005; puts;
    ready? 
end

def cloud_source (place)
    
    forecast = [] # array of left,right,middles

    (rand(20..25)).times do    
        cloud = $clouds.sample; sleep 0.15;
        puts cloud;
        if cloud[0] === "🟥"
            forecast.push("left")
        elsif cloud[5] === "🟥"
            forecast.push("middle")
        else
            forecast.push("right")
        end
    end
    if place ==  "left"
        puts $dudes[0] #left
    elsif place == "middle"
        puts $dudes[1] #middle
    elsif place == "right"
        puts $dudes[2] #right
    end
    
    puts $line

    if place == forecast[-1]
        puts "You chose #{place}. You lose sucker!"; puts;
        type "You scored", 0.02; type " #{$current_score} points."; puts; puts;
        type "Highschore is #{$high_score}"
        $current_score = 0
    else
        $current_score += 1
        puts "Nice one! You weren't crushed! You chose the #{place}."; puts;

        if $current_score > $high_score
            puts "Wow! New highscore!"; puts;
            $high_score = $current_score
        end
        
        type "You're score is #{$current_score}                 The highschore is #{$high_score}"
    end 
end

def ask_position

    valid_texts  = ["left","middle","right"]
    
    puts
    type " Where are you standing?"; sleep 0.1
    type " Left, Middle, or Right?"; puts;
    type " Type your choice...",0.02; puts; puts;
    type $line, 0.0005; puts;
    print " "
    position = gets.chomp.downcase;
    puts $line

    if !valid_texts.include?(position)
        puts; puts "Invalid input, please try again";
        ask_position()
    end

    type "     You've chosen #{position.capitalize}"; puts; sleep 1;
    type $line, 0.0003; puts;
    return position   
end

def play_again? 
    puts
    type $line, 0.001; puts;
    type " Would you like to play again?\n Type 'y' or 'n'", 0.008; puts;
    print " "
    answer = gets.chomp.to_s.downcase
    puts $line
    if answer == 'y'
        type " Awesome, let's do it", 0.035; puts;
        type $line,0.0005; puts; puts;
        play_round()
    elsif answer == 'n'
        sleep 0.5
        type $line,0.008; puts;
        type " Okay, thanks for playing!" ; sleep 0.2
        type " See you next time :D"
        exit
    else
        type " Invalid input, please try again",0.025; puts;
        play_again()
    end
end

def play_round
    position = ask_position()
    cloud_source(position)
    play_again?
end

# Game Script below

type "Loading..." ; puts;
begin_text
play_round
# TO DO, SET DIFFERENT DIFFICULTIES




    
