class Game < ActiveRecord::Base
  has_many :user_games
  has_many :players, through: :user_games

  validates :name, presence: true
  validate :only_two_players

  private

  def only_two_players
    self.players.length === 2
  end

end
