class InterviewQuestionsController < ApplicationController
  before_action :set_interview_question, only: [:show, :update, :destroy]

  # GET /interview_questions
  def index
    @interview_questions = InterviewQuestion.all

    render json: @interview_questions
  end

  # GET /interview_questions/1
  def show
    render json: @interview_question
  end

  # POST /interview_questions
  def create
    @interview_question = InterviewQuestion.new(interview_question_params)

    if @interview_question.save
      render json: @interview_question, status: :created, location: @interview_question
    else
      render json: @interview_question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /interview_questions/1
  def update
    if @interview_question.update(interview_question_params)
      render json: @interview_question
    else
      render json: @interview_question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /interview_questions/1
  def destroy
    @interview_question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_question
      @interview_question = InterviewQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interview_question_params
      params.require(:interview_question).permit(:interview_id, :question_id)
    end
end
