class TagsController < ApplicationController
  def index
    @tags = Upload.all_tags.find_all{|item| item[:name].starts_with? params[:tag]}
  end

end
