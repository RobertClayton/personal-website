require 'bcrypt'

class User


  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation, :password_digest

  property :id, Serial
  property :name, String
  property :email, String
  property :encrypted_password, Text

  has n, :rentals
  has n, :reviews

  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.encrypted_password) == password
      user
    else
      nil
    end
  end

  def self.email_checker(email)
    user = first(email: email)
    if user
      true
    else
      false
    end
  end

  validates_confirmation_of :password
end
