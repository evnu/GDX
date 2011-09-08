require 'carrierwave/mongoid'

class Upload
  include Mongoid::Document
  include Mongoid::Document::Taggable
  belongs_to :user

  mount_uploader :file, FileUploader

  field :name, :type => String
  field :description, :type => String
  field :contains_raster_data, :type => Boolean
  field :contains_vector_data, :type => Boolean

  validates_presence_of :name
  validates_presence_of :user

  validates_length_of :description, :in => 0..500

  def self.searchByTags(params)
    return Upload.all unless params
    results = []
    params.split(/[ ,]/).each do |tag|
      results |= Upload.tagged_with tag
    end
    return results
  end

  def self.paginate_array(array, params)
    per_page = params[:per_page]
    per_page = 10 unless per_page

    # use only the results in the current page
    # NOTE: this might be a huge performance hit. Why should we first 
    # get all values and then throw most of them away?
    # NOTE: we have to determine the number of pages before doing this, because
    # we have to use the total number of results
    num_pages = (array.count.to_f / per_page).ceil
    @paginated_array = array[per_page*params[:page].to_i..per_page*(params[:page].to_i+1)] if params[:page]
    @paginated_array = array[0..per_page] unless params[:page]

    if not @paginated_array
      @paginated_array = []
    end

    # make kaminari work with an array
    # see http://code.dblock.org/mongoid-202-dropped-pagination-kaminari
    @paginated_array.instance_eval <<-EVAL
        def current_page
          #{params[:page] || 1}
        end
        def num_pages
          #{num_pages}
        end
        def limit_value                                                                               
          #{per_page}
        end
    EVAL

    return @paginated_array
  end
end
