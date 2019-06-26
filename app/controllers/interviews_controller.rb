class InterviewsController < ApplicationController
  include Pagy::Backend
  #helper_method :sort_column, :sort_direction
  has_scope :by_name, :by_company, :by_interviewer
  before_action :set_interview, only: [:show, :update, :destroy]

  # GET /interviews
  def index
    @interviews = pagy(apply_scopes(Interview.includes(:user).order(sort_column + " " + sort_direction)), items: params[:items])
    #json_string = InterviewSerializer.new(@interviews[1]).serialized_json
    render json: @interviews.as_json(include: :user)
  end

  # GET /interviews/1
  def show
    render json: @interview
  end

  # POST /interviews
  def create
    @interview = Interview.new(interview_params)

    if @interview.save
      render json: @interview, status: :created, location: @interview
    else
      render json: @interview.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /interviews/1
  def update
    if @interview.update(interview_params)
      render json: @interview
    else
      render json: @interview.errors, status: :unprocessable_entity
    end
  end

  # DELETE /interviews/1
  def destroy
    @interview.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interview_params
      params.require(:interview).permit(:name, :dimentions, :motivational_questions, :company, :user_id)
    end

    def sort_column
      Interview.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
