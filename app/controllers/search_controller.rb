class SearchController < ApplicationController

  def search
    query = params[:query]
    find_query = Profile.where("name LIKE ? OR username LIKE ? OR description LIKE ?", "%#{query}%","%#{query}%","%#{query}%")
    search_results = find_query
    render json: search_results
  end

end