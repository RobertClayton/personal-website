ENV['RACK_ENV'] ||= 'development'

require 'bcrypt'
require 'json'
require 'sinatra/base'
require 'sinatra/flash'
require './app/models/data_mapper_setup'
require_relative './models/user'
require_relative './models/rental'

class MakersBnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  helpers do

    def reset_current_session_user
      @current_user = nil
    end

    def current_session_user
      @current_user ||= User.first(email: session[:email]) if session[:email]
    end

  end

  get '/' do
    erb :landing
  end

  get '/signup' do
    erb :signup
  end

  post '/signup/new' do
    if User.email_checker(params[:email])
      flash.now[:inuse] = 'Email already in use. SOZ LOLZ!!!!!'
      erb :signup
    else
      newuser = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      if newuser.save
        session[:email] = params[:email]
        redirect '/welcome'
      else
        flash.now[:message] = 'Passwords do not match'
        erb :signup
      end
    end
  end

  post '/landing/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:email] = params[:email]
      redirect '/welcome'
    else
      flash.now[:error] = 'Email and Password does not match' 
      erb :landing
    end
  end

  get '/rental/new' do
    headers 'Access-Control-Allow-Origin' => '*'
    erb :rental_new
  end

  post '/rental/new' do
    @current_user = User.create(name: params[:user_name])

    @current_rental = Rental.create(name: params[:name], location: params[:location],
      price: params[:price], capacity: params[:capacity], available: true,
      user_id: @current_user.id, description: params[:description])
    @current_image = Image.create(source: params[:picture], rental_id: @current_rental.id)

    redirect '/welcome'
  end

  get '/rental/list' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    Rental.all_data.to_json
    # Review.all.to_json
  end

  post '/rental/book' do
    @startDate = params[:startDate]
    @endDate = params[:endDate]
    erb :booking_confirmation
  end

  post '/rental/save' do
    session[:id]= params[:id]
    redirect '/rental/overview'
  end

  get '/rental/current_view' do
    rental = Rental.individual(session[:id])
    content_type :json
    rental.to_json
  end

  get '/rental/overview' do
    erb :rental_overview
  end

  get '/rental/save' do
  session[:rental] = Rental.individual(params[:id])
    redirect '/rental/overview'
  end

  post '/rental/overview' do
  Review.create(description: params[:description],
                  experience: true , user_id: current_session_user.id, rental_id: session[:id])
    redirect '/rental/overview'
  end

  get '/welcome' do
    erb :welcome
  end

  get '/welcome/logout' do
    session.clear
    reset_current_session_user
    redirect '/'
  end


get '/about' do
  erb :about
end

end
