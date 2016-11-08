# before '/game/*' do
#   if !player_1 || !player_2
#     redirect '/'
#   end
# end
get '/game' do
  @games = Game.all
  erb :'game/index'
end

get '/game/new' do
  erb :'game/new'
end

post '/game' do
 player1 = Player.create!(username: params[:player1])
 player2 = Player.create!(username: params[:player2])
 @game = Game.new(name: params[:name])
 @game.players << player1
 @game.players << player2
 if @game.save
    redirect "/game/#{@game.id}"
  else
    @errors = "x"
    erb :'game/new'
  end
end

get '/game/:id' do
  @game = Game.find(params[:id])
  erb :'game/show'
end
