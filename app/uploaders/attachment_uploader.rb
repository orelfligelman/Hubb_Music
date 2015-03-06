# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base
  # include CarrierWave::Video  # for your video processing
  # include CarrierWave::Video::Thumbnailer
  # process encode_video: [:mp4, callbacks: { after_transcode: :set_success } ]
  # process :encode
  # DEFAULTS = {
  #   watermark: {
  #     path: Rails.root.join('watermark-large.png')
  #   }
  # }
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # def encode
  #   encode_video(:mp4, DEFAULTS) do |movie, params|
  #     if movie.height < 720
  #       params[:watermark][:path] = Rails.root.join('watermark-small.png')
  #     end
  #   end
  # end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #  process :resize_to_limit => [200, 200]
  # def full_filename for_file
  #     png_name for_file, version_name
  #   end
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  #   def png_name for_file, version_name
  #   %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  # end

end
