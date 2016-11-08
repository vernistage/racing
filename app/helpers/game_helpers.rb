helpers do

  def current_time(timestamp)
    cst = timestamp - 6.hours
    Time.at(cst).strftime("%B %e, %Y at %I:%M %p")
  end

  def game_duration(game)
    binding.pry
    (Time.now - game.created_at)
  end

  def game_winner(game, winner)
    if winner === "1"
      game.winner = game.players[0].username
    elsif winner === "2"
      game.winner = game.players[1].username
    end
  end

end
