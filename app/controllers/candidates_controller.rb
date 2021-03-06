class CandidatesController < ApplicationController
  include Pagy::Backend
  before_action :set_candidate, only: [:show, :update, :destroy]
  has_scope :by_name, :by_email
  before_action  :authenticate_user!, only: [:create]


  # GET /candidates
  def index
    @candidates = pagy(apply_scopes(Candidate.all), items: params[:items])

    render json: @candidates
  end

  # GET /candidates/1
  def show
    render json: @candidate
  end

  # POST /candidates
  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      render json: @candidate, status: :created, location: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /candidates/1
  def update
    if @candidate.update(candidate_params)
      render json: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /candidates/1
  def destroy
    @candidate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def candidate_params
      params.require(:candidate).permit(:name, :email)
    end
end
