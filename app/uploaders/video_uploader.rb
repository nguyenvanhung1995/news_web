# frozen_string_literal: true

class VideoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w[mp4 avi mov flv wmv]
  end
end
