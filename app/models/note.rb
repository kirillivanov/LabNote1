class Note < ActiveRecord::Base
  attr_accessible :text, :page_id, :experiment_id, :attachment,  :remote_attachment_url
  mount_uploader :attachment, AttachmentUploader
  belongs_to :page
  belongs_to :experiment
  default_scope :order => 'notes.created_at DESC'
end
