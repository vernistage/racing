class Player < ActiveRecord::Base
  has_many :user_games
  has_many :games, through: :user_games

  validates :username, presence: true, uniqueness: true
end
