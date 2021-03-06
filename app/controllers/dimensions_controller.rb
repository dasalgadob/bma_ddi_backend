class DimensionsController < ApplicationController
  before_action :set_dimension, only: [:show, :update, :destroy]

  # GET /dimensions
  def index
    @dimensions = Dimension.all
    json_string = DimensionSerializer.new(@dimensions).serialized_json
    render json: json_string#@dimensions.as_json(include: [:name, :description, :questions])
  end

  # GET /dimensions/1
  def show
    json_string = DimensionSerializer.new(@dimension, include: [:questions]).serialized_json
    render json: json_string
  end

  # POST /dimensions
  def create
    @dimension = Dimension.new(dimension_params)

    if @dimension.save
      render json: @dimension, status: :created, location: @dimension
    else
      render json: @dimension.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dimensions/1
  def update
    if @dimension.update(dimension_params)
      render json: @dimension
    else
      render json: @dimension.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dimensions/1
  def destroy
    @dimension.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dimension
      @dimension = Dimension.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dimension_params
      params.require(:dimension).permit(:name_id, :description_id)
    end
end
