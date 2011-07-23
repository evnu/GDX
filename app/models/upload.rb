class Upload
  include Mongoid::Document
  include Mongoid::Document::Taggable
  field :name, :type => String
  field :description, :type => String

  mount_uploader :file, FileUploader
end
