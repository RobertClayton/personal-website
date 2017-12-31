require 'digest'
require 'json'
class Block
  attr_accessor :index, :previous_hash, :nonce, :transaction
  attr_reader :timestamps, :hash, :hashes

  def initialize(transaction)
    @index = 1
    @previous_hash= ''
    @transaction = transaction.to_json
    @timestamps = "#{Time.now()}"
    @nonce = 0
    @hashes = []
  end

  def sha256(hash)
    Digest::SHA256.hexdigest(hash).to_s
  end

  def calculate_hash
      @hash = sha256(@index.to_s + @timestamps + @transaction + @previous_hash + @nonce.to_s)
  end

  def mine_block(difficulty)
    @hashes = []
    while @hash[0..difficulty-1] != '0'*difficulty do
      @nonce+=1
      @hashes << @hash
      self.calculate_hash
    end
  end

end
