# encoding: utf-8

class FeatureBUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :quality => 80
  process :resize_to_fit => [450, 188]

  def extension_white_list
    %w(jpg jpeg png)
  end

end
