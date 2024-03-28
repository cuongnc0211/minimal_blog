ActiveAdmin.register WorkExp do
  permit_params :company_name, :position, :start_time, :end_time, :description
end
