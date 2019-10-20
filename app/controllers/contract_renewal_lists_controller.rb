class ContractRenewalListsController < ApplicationController
  before_action :set_contract_renewal_list, only: [:show, :update, :destroy]

  # GET /contract_renewal_lists
  def index
    @contract_renewal_lists = ContractRenewalList.all

    render json: @contract_renewal_lists
  end

  # GET /contract_renewal_lists/1
  def show
    render json: @contract_renewal_list
  end

  # POST /contract_renewal_lists
  def create
    @contract_renewal_list = ContractRenewalList.new(contract_renewal_list_params)

    if @contract_renewal_list.save
      render json: @contract_renewal_list, status: :created, location: @contract_renewal_list
    else
      render json: @contract_renewal_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contract_renewal_lists/1
  def update
    if @contract_renewal_list.update(contract_renewal_list_params)
      render json: @contract_renewal_list
    else
      render json: @contract_renewal_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contract_renewal_lists/1
  def destroy
    @contract_renewal_list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_renewal_list
      @contract_renewal_list = ContractRenewalList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contract_renewal_list_params
      params.require(:contract_renewal_list).permit(:name, :description, :user_id)
    end
end
