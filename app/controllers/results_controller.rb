class ResultsController < ApplicationController
  include Pagy::Backend
  before_action :set_result, only: [:show, :update, :destroy]
  has_scope :by_position, :by_company, :by_interviewer, :by_candidate


  # GET /results
  def index
    @results = pagy(apply_scopes(Result.order(sort_column + " " + sort_direction)), items: params[:items])

    render json: @results.as_json(include: [:user, :candidate])
  end

  # GET /results/1
  def show
    render json: ResultSerializer.new(@result).serialized_json
  end

  # POST /results
  def create
    @result = Result.new(result_params)

    if @result.save
      render json: @result, status: :created, location: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /results/1
  def update
    if @result.update(result_params)
      render json: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /results/1
  def destroy
    @result.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def result_params
      params.require(:result).permit(:position, :answers, :motivational_competence,
       :base_salary, :benefits, :salary_expectations,
        :geographical_areas, :company, :editable, :user_id, :candidate_id)
    end

    def sort_column
      Result.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
