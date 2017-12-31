require './lib/block'
class BlockChain
  attr_accessor :difficulty
  attr_reader :chain, :transactions

  def initialize
    @chain = [create_genesis_block()]
    @difficulty = 2
    @transactions = []
  end

  def create_genesis_block
    block = Block.new('')
    block.calculate_hash
    return block
  end

  def last_block
    return @chain.last
  end

  def add_block(transaction)
    block = Block.new(transaction)
    block.index = @chain.size+1
    block.previous_hash = @chain.last.hash
    block.calculate_hash
    block.mine_block(@difficulty)
    @chain << block
  end

  def add_transaction(recipient, sender, amount)
    new_transaction = Transaction.new(recipient, sender, amount)
    @transactions << new_transaction.get_transaction
  end

  def mine_pending_transactions
    if @transactions.length > 0
      transaction = @transactions.shift
      add_block(transaction)
    end
  end

  def self.create
    @blockchain = BlockChain.new
  end

  def self.instance
   @blockchain ||= self.create
  end

end
