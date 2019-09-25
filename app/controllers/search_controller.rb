class SearchController < ApplicationController

  def search
    query = params[:query]
    pp params
    find_query = Profile.where("name ILIKE ? OR
                                username ILIKE ? OR
                                description ILIKE ?",
                               "%#{query}%",
                               "%#{query}%",
                               "%#{query}%"
                              ).uniq
    search_results = find_query
    render json: search_results
  end

end