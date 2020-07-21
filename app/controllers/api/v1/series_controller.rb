class Api::V1::SeriesController < ApplicationController
  def show
    @serie = Serie.find(params[:id])
    render json:  Api::V1::SerieSerializer.new(@serie, params: {user: current_user}).serialized_json
  end
end
