require 'sinatra/base'
require './lib/blockchain.rb'
require './lib/user'
require './lib/transaction'

class App < Sinatra::Base

  before do
    @blockchain = BlockChain.instance
  end

  get '/' do
    @chain = @blockchain.chain.reverse
    @last_block = @blockchain.last_block
    erb :index
  end

  get '/transaction/new' do
  erb :new
  end

  post '/transaction/new' do
    @blockchain.add_transaction(params[:recipient], params[:sender], params[:amount])
    redirect '/'
  end

  get '/mine' do
    @blockchain.mine_pending_transactions
    redirect '/'
  end

end
