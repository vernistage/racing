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


patch '/game/:id' do
  @game = Game.find(params[:id])
  game_winner(@game, params['winner'])
  @game.start = accurate_time(@game.created_at)
  if @game.save #saves new game or returns false if unsuccessful
    @game.finished = accurate_time(@game.updated_at)
    @game.duration = game_duration(@game)
    @game.save
    if request.xhr?
      @game.to_json
    else
      redirect "/game/#{@game.id}"
    end
  else
    @error = "error saving winner"
    erb :'game/show' #show edit game view again(potentially displaying errors)
  end
end

