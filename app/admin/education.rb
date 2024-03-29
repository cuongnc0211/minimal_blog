ActiveAdmin.register Education do
  permit_params :school, :degree, :major, :description, :graduation_date, :start_date, :gpa
end
