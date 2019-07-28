class InterviewsController < ApplicationController

  before_action  :authenticate_user!, only: [:create]

  include Pagy::Backend
  #helper_method :sort_column, :sort_direction
  has_scope :by_name, :by_company, :by_interviewer
  before_action :set_interview, only: [:show, :update, :destroy]

  # GET /interviews
  def index
    @interviews = pagy(apply_scopes(Interview.order(sort_column + " " + sort_direction)), items: params[:items])
    #json_string = InterviewSerializer.new(@interviews[1]).serialized_json
    render json: @interviews.as_json(include: [:user, :questions ], methods: [:dimensions])
  end

  # GET /interviews/1
  def show
    render json: InterviewSerializer.new(@interview, include: [:questions]).serialized_json
  end

  # POST /interviews
  def create
    puts "current user"
    puts current_user.id
    puts interview_params[:questions_array]
    @interview = Interview.new(interview_params.except(:questions_array))
    @interview.user_id = current_user.id
    if @interview.save
      #If the interview was created, then create its proper interview_questions records
      @interview.add_interview_questions(interview_params[:questions_array])

      render json: @interview, status: :created, location: @interview
    else
      render json: @interview.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /interviews/1
  def update
    ##Iterates through questions array.
    ##If the question id belong to the array 
    @interview.interview_questions.destroy_all
    @interview.add_interview_questions(interview_params[:questions_array])
    if @interview.update(interview_params.except(:questions_array))
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
      params.require(:interview).permit(:name, :dimentions, :motivational_questions, :company, :user_id, questions_array: [])
    end

    def sort_column
      Interview.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

end
