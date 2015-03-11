class Music < ActiveRecord::Base
  # include ParseModel::Model
	mount_uploader :attachment, AttachmentUploader
	def set_success(format, opts)
    self.success = true
  end

  def parse
    file = Parse::File.new({
                               :body => "Frank!",
                               :local_filename => "hello.txt",
                               :content_type => "text/plain"
                           })
    file.save
  end
end
