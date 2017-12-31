class User
  attr_reader :id
  attr_accessor :balance

  def initialize(id_number)
    @id = id_number
    @balance = 100
  end
end
