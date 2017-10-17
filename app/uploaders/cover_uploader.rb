# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/images/fallback/cover/" + [version_name, "default.png"].compact.join('_')
  end

  process :quality => 80
  process resize_to_fit: [250, 250]

  version :thumb do
     process resize_to_fit: [80, 80]
     process :quality => 80
  end


  def extension_white_list
    %w(jpg jpeg png)
  end

  def filename
    "cover.jpg" if original_filename
  end

end
