class Music < ActiveRecord::Base
  # include ParseModel::Model
	mount_uploader :attachment, AttachmentUploader
	def set_success(format, opts)
    self.success = true
  end
  def parse
    file = "/Users/adityanarayan/Desktop/orel/Hubb_Music/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
