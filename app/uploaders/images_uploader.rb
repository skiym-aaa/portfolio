class ImagesUploader < CarrierWave::Uploader::Base
  # permissions 0777
  # MiniMagickを有効にする
  include CarrierWave::MiniMagick

  # このアップローダーを利用した画像の最大数を指定
  process resize_to_fit: [1920, 1280]

  # 上記とは別にサムネイルを別サイズで用意
  version :thumb do
    process resize_to_fill: [240, 240]
  end
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :fog # fileにするとArgumentError
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    if Rails.env.production?
      if model.class.to_s.underscore == "place_photo"
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.place.id}"
      elsif model.class.to_s.underscore == "event_photo"
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.event.id}"
      else
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    else
      if model.class.to_s.underscore == "place_photo"
        "uploads/local/#{model.class.to_s.underscore}/#{mounted_as}/#{model.place.id}"
      elsif model.class.to_s.underscore == "event_photo"
        "uploads/local/#{model.class.to_s.underscore}/#{mounted_as}/#{model.event.id}"
      else
        "uploads/local/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end

  def extension_whitelist
    %w[png jpg]
  end

  def filename
    original_filename
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
