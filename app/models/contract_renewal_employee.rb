class ContractRenewalEmployee < ApplicationRecord
  belongs_to :contract_renewal_list
  belongs_to :employee
end
