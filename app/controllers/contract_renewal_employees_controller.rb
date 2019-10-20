class ContractRenewalEmployeesController < ApplicationController
  before_action :set_contract_renewal_employee, only: [:show, :update, :destroy]

  # GET /contract_renewal_employees
  def index
    @contract_renewal_employees = ContractRenewalEmployee.all

    render json: @contract_renewal_employees
  end

  # GET /contract_renewal_employees/1
  def show
    render json: @contract_renewal_employee
  end

  # POST /contract_renewal_employees
  def create
    @contract_renewal_employee = ContractRenewalEmployee.new(contract_renewal_employee_params)

    if @contract_renewal_employee.save
      render json: @contract_renewal_employee, status: :created, location: @contract_renewal_employee
    else
      render json: @contract_renewal_employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contract_renewal_employees/1
  def update
    if @contract_renewal_employee.update(contract_renewal_employee_params)
      render json: @contract_renewal_employee
    else
      render json: @contract_renewal_employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contract_renewal_employees/1
  def destroy
    @contract_renewal_employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_renewal_employee
      @contract_renewal_employee = ContractRenewalEmployee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contract_renewal_employee_params
      params.require(:contract_renewal_employee).permit(:email_sent, :form_submitted, :email_sent_at, :form_submitted_at, :contract_renewal_list_id, :employee_id)
    end
end
