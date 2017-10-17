# encoding: utf-8

class BackgroundUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
     "/images/fallback/background/" + [version_name, "default.png"].compact.join('_')
  end

  process resize_to_fill: [1920, 660, "center"]
  process :quality => 80

  version :thumb do
    process resize_to_fill: [280, 160, "center"]
    process :quality => 80
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

end
