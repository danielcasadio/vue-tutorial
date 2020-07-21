class Api::V1::SearchesController < ApplicationController
  def index
    check_search_value and (return if performed?)
    search = PgSearch.multisearch(params[:value]).order("created_at DESC")
    render json: Api::V1::WatchableSerializer.new(search.map(&:searchable)).serialized_json
  end

  private

  def check_search_value
    if params[:value].present? && params[:value].lenght < 3
      render json: { errors: 'Search value must be greater than 3 characters'}
    end
  end
end
