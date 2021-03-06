  # encoding: utf-8

class ScreenshotUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  process :resize_to_fit => [400, 600]

  version :thumb do
    process :resize_to_fit => [200, 300]
  end

  def default_url
    size = case version_name
           when :thumb then "100x150"
           else "400x600"
           end
    "holder.js/#{size}/text:#{size}/social"
  end
end
