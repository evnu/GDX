class Upload
  include Mongoid::Document
  include Mongoid::Document::Taggable
  belongs_to :user

  field :name, :type => String
  field :description, :type => String

  validates_presence_of :name
  validates_presence_of :user

  mount_uploader :file, FileUploader

  def self.searchByTags(params)
    return Upload.all unless params
    results = []
    params.split(/[ ,]/).each do |tag|
      results |= Upload.tagged_with tag
    end
    return results
  end
end
