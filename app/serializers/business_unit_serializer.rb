class BusinessUnitSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :code, :name
end
