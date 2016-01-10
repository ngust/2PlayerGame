class Player
  #attr_reader :name, :lives

  def initialize(name, lives)
    @lives = lives
    @name = name
  end

def name
  @name
end
  # def player_name
  #   puts "What is your name?"
  #   @name = gets.chomp
  # end

end