class Player
  attr_accessor :name, :lives , :points

  def initialize(name, lives, points)
    @lives = lives
    @name = name
    @points = points
  end

  # def player_name
  #   puts "What is your name?"
  #   @name = gets.chomp
  # end

end