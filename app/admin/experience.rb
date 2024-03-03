ActiveAdmin.register Experience do
  permit_params :company_name, :job_title, :period, :description
end
