### Sky Fall Game

# Assets

$left = "🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜\n🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜\n🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜\n🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜"
$middle = "⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜\n⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜\n⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜\n⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥⬜⬜⬜⬜⬜"
$right = "⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥\n⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥\n⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥\n⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜🟥🟥🟥🟥🟥"

$line = Array.new(65, "=").join("")
$air = %                             #This is empty space

$clouds = [$left, $middle, $left, $right, $middle, $right]


def type (text,speed = 0.045)
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

def play_round
    puts
    type " Where are you standing?"; sleep 0.3
    type " Left, Middle, or Right?"
    type " Type your choice..."; puts;
    type $line, 0.001; puts;
    position = gets.chomp.downcase
    type $line, 0.0003; puts;
    type "You chose #{position.capitalize}"; puts; sleep 1;
    type $line, 0.0003; puts;
    forecast = []
    (rand(20..25)).times do    
        cloud = $clouds.sample; sleep 0.1;
        puts cloud;
        if cloud[0] === "🟥"
            forecast.push("left")
        elsif cloud[5] === "🟥"
            forecast.push("middle")
        else
            forecast.push("right")
        end
    end
    puts $line

    if position == forecast[-1]
        puts "You chose #{position}. You lose sucker!"
    else
        puts "You chose #{position}. Nice one!"
    end
    
    # $count += 1
    # break if $count === 20
end

type "Loading..."
puts
begin_text
play_round
# TO DO, SET DIFFERENT DIFFICULTIES




    
