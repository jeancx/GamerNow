# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :quality => 80
  process resize_to_limit: [1280, 720]

  version :thumb do
    process :resize_and_pad => [280, 160, "#FFF", "Center"]
    process :quality => 80
  end

  version :small do
    process :resize_to_fill => [80, 80, "center"]
    process :quality => 80
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
