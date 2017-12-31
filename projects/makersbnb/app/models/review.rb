class Review
  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :experience, Boolean
  belongs_to :rental
  belongs_to :user
end
