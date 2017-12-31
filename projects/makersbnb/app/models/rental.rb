class Rental

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :location, String
  property :price, Integer
  property :available, Boolean
  property :capacity, Integer
  property :description, Text

  belongs_to :user

  has n, :images
  has n, :reviews
  has n, :likes

  def self.all_data
    data = []
    self.all.each do | ind |
      data <<  { id:       ind.id,
                 name:     ind.name,
                 location: ind.location,
                 price:    ind.price,
                 capacity: ind.capacity,
                 images:   ind.images.first,
                 description:   ind.description,
                 likes:     ind.likes

    }
    end
  data
  end

  def self.all_reviews
    array = []
    Review.all.each do |x|
     if x.rental_id == 2
       array << x
     end
    end
    array
  end

  def self.individual(id)
    # array = []
    # Review.all.each do |x|
    #  if x.rental_id == id.to_i
    #    array << x
    #  end
    # end
    individual =[]
    individual << { user: self.first(id: id),
                   images: Image.first(rental_id: id),
                   reviews: Review.all(rental_id: id.to_i)
                  }
     individual
  end

end
