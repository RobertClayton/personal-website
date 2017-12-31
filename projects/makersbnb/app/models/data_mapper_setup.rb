require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'carrierwave/datamapper'
require_relative './imageuploader.rb'
require_relative './rental.rb'
require_relative './user.rb'
require_relative './image.rb'
require_relative './review.rb'
require_relative './like.rb'


CarrierWave.configure do |config|
  # if ENV['RACK_ENV'] == 'development'
    config.storage :file
    config.root = File.join(File.dirname(__FILE__), '..', 'public')
    config.store_dir = File.join('uploads')
  # else
   #Configure AMAZON storage
  # end
end

# DataMapper::Model.raise_on_save_failure = true
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade! if ENV['RACK_ENV'] == 'test'
