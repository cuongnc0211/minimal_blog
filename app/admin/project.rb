ActiveAdmin.register Project do
  permit_params :title, :description, :start_date, :end_date, :team_size, :position, :url, :project_type, :cover_image

  index do
    selectable_column
    id_column
    column :title
    column :start_date
    column :end_date
    column :project_type
    column :team_size
    column :prosition

    actions
  end

  filter :title, as: :string
  filter :project_type, as: :select, collection: Project::PROJECT_TYPES, include_blank: false

  form do |f|
    f.inputs do
      f.input :title
      f.input :project_type, as: :select, collection: Project::PROJECT_TYPES, include_blank: false
      f.input :start_date, as: :date_picker
      f.input :end_date, as: :date_picker
      f.input :team_size
      f.input :position
      f.input :url

      f.rich_text_area :description, input_html: { rows: 90 }
    end
    f.actions
  end

  controller do
    def new
      redirect_to new_admin_custom_project_path
    end

    def edit
      redirect_to edit_admin_custom_project_path(id: params[:id])
    end
  end

end
