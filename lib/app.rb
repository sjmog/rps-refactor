require 'sinatra/base'
require_relative 'computer'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    erb :register
  end

  post "/register" do
    session[:user_name] = params[:user_name]
    redirect '/start-game'
  end

  get '/start-game' do
    erb :start_game
  end

  post '/choose-shape' do
    @choice = params[:choice]
    @computer = Computer.new
    @computer.play
    @computer_result = @computer.result_against(@choice.to_sym)
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
