require_relative 'person'

# Two Player Game
@range = (1..20)
@operators = ["+", "-", "*"]
#@rand_operator = @operators.sample
# @player1.lives = 3
# @player2.lives = 3


def player_names
  puts "\nPlayer 1, what is your name?"
    @player1 = Player.new(gets.chomp, 3, 0)
  puts "\nPlayer 2, what is your name?"
    @player2 = Player.new(gets.chomp, 3, 0)
end

def question
  @num1 = rand(@range)
  @num2 = rand(@range)
  #Prompt for answer
  puts "what does #{@num1} #{@rand_operator} #{@num2} equal?"
    # # Experimental Counter
    #   8.downto(1) do |i|
    #   print "#{'%01d' % i}\r"
    #   sleep 1
    # end
    # puts "too slow"
  @user_answer = gets.chomp.to_i
end

def verify_answer
  calc_answer
  if @realAnswer == @user_answer
    puts "#{@player.name} you are right!"
    who_points
  else
    puts  "#{@player.name} you are wrong.  Maybe next time ;)."
    who_dies
  end
end

def who_dies
  if @turn % 2 == 0
    @player2.lives -= 1
    puts "#{@player.name}, You have #{@player2.lives} lives left"
  else
    @player1.lives -= 1
    puts "#{@player.name}, You have #{@player1.lives} lives left"
  end
end

def who_points
  if @turn % 2 == 0
    @player2.points += 1
    puts "#{@player.name}, You have #{@player2.points} points"
  else
    @player1.points += 1
    puts "#{@player.name}, You have #{@player1.points} points"
  end
end

def calc_answer
  case @rand_operator
  when '+'
    answer = @num1 + @num2
  when '-'
    answer = @num1 - @num2
  when '*'
    answer = @num1 * @num2
  end
  @realAnswer = answer
  puts "real answer = #{@realAnswer}"
end

def turn_loop
  @turn = 1
   while @player1.lives > 0 && @player2.lives > 0 do
     player_turn
     puts "\n#{@player.name}, Here comes the question!"
     @rand_operator = @operators.sample
     question
     verify_answer
     @turn += 1
   end
  final_score
  who_wins?
  #Play again
end

def player_turn
  if @turn % 2 == 0
    @player = @player2
  else
    @player = @player1
  end
end

def who_wins?
  if @player1.points > @player2.points
    puts ""
    puts "#{@player1.name} wins!!!!!!!!!" 
    puts "#{@player1.name} has #{@player1.lives} lives left" 
  else
    puts "#{@player2.name} wins!!!!!!!!!" 
    puts "#{@player2.name} has #{@player2.lives} lives left" 
  end
end

def final_score
  puts "\nThe final score is:"
  puts "#{@player1.name} --> #{@player1.points} points"
  puts "#{@player2.name} --> #{@player2.points} points"
end
player_names
turn_loop