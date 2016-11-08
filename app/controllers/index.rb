get '/' do
  @games = Game.all
  erb :'game/index'
end
