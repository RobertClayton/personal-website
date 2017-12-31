class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  def extensions_white_list
        %w(jpg jpeg gif png)

    end
end
