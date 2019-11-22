class BusinessUnitSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :code, :name, :updated_at, :created_at
end
