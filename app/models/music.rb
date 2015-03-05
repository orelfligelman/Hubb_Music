class Music < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	def set_success(format, opts)
    self.success = true
  end
end
