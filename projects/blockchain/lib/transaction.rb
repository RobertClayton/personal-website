class Transaction
  attr_reader :recipient, :sender, :amount

  def initialize(recipient, sender, amount)
    @recipient = recipient
    @sender = sender
    @amount = amount
  end

  def get_transaction
    {
      recipient: @recipient,
      sender: @sender,
      amount: @amount
    }
  end
end