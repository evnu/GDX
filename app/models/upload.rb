class Upload
  include Mongoid::Document
  include Mongoid::Document::Taggable
  field :name, :type => String
  field :description, :type => String

  mount_uploader :file, FileUploader

  def self.searchByTags(params)
    return Upload.all if params == nil
    results = []
    params.split(",").each do |tag|
      results |= Upload.tagged_with tag
    end
    return results
  end
end
