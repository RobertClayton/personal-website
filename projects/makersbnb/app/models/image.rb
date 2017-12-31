class Image
  include DataMapper::Resource

  property :id, Serial
  mount_uploader :source, ImageUploader

  belongs_to :rental
end
