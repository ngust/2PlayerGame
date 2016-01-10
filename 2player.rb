# Two Player Game
@range = (1..20)
@operators = ["+", "-", "*"]
#@rand_operator = @operators.sample
@p1_lives = 3
@p2_lives = 3

def player_names
  puts "Player 1, what is your name?"
    @player1 = gets.chomp
  puts "Player 2, what is your name?"
    @player2 = gets.chomp
end

def question
  #randOperator rand (Operators)
  @num1 = rand(@range)
  @num2 = rand(@range)
  #Prompt for answer
  puts "what does #{@num1} #{@rand_operator} #{@num2} equal?"
  @user_answer = gets.chomp.to_i
end

def verify_answer
  #realAnswer = @num1 @rand_operator @num2
  #realAnswer = @num1 @rand_operator @num2
  calc_answer
  if @realAnswer == @user_answer
    puts "you are right"
  else
    puts  "you are wrong"
    who_dies
  end
end

def who_dies
  if @turn % 2 == 0
    @p2_lives -= 1
    puts "#{@player}, You have #{@p2_lives} lives left"
  else
    @p1_lives -= 1
    puts "#{@player}, You have #{@p1_lives} lives left"
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
   while @p1_lives > 0 && @p2_lives > 0 do
     player_turn
     puts "#{@player}, Here comes the question!"
     @rand_operator = @operators.sample
     question
     verify_answer
     @turn += 1
   end
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
  if @p1_lives > @p2_lives
    puts "#{@player1} wins!!!!!!!!!" 
    puts "#{@player1} has #{@p1_lives} lives left" 
  else
    puts "#{@player2} wins!!!!!!!!!" 
    puts "#{@player2} has #{@p2_lives} lives left" 
  end
end

player_names
turn_loop