class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  has_scope :mandatory
  has_scope :by_motivational_dimension

  # GET /questions
  def index
    @questions = apply_scopes(Question.order(sort_column + " " + sort_direction))

    render json: QuestionSerializer.new(@questions).serialized_json
  end

  # GET /questions/1
  def show
    render json: @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:name, :description, :code, :translation_id, :translation_b_id, :mandatory)
    end

    def sort_column
      Question.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc
      "
    end
end
