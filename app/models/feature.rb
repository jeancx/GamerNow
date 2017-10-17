class Feature < ActiveRecord::Base
  belongs_to :post

  mount_uploader :image_a, FeatureAUploader

  mount_uploader :image_b, FeatureBUploader


end
