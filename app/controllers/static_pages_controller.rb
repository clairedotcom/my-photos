class StaticPagesController < ApplicationController
  require 'flickr'
  
  def index
    flickr = Flickr.new(ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET'])

    if params.has_key?(:commit)
      @photos = flickr.people.getPhotos(api_key: ENV['FLICKR_API_KEY'], user_id: params[:user_id]) 
    end
  end
end
