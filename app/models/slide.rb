class Slide < ActiveRecord::Base

  mount_uploader :image, ImageUploader

end
