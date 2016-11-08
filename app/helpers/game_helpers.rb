helpers do

  def game_duration(game)
    binding.pry
    (Time.now - game.created_at)
  end

end
