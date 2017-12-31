class Like
  include DataMapper::Resource

  property :id, Serial
  property :count, Integer
  belongs_to :rental
end
