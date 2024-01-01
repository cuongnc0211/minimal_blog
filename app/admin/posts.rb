ActiveAdmin.register Post do
  permit_params :title, :description, :status, :is_priority, :content

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :status
    column :is_priority
    column :created_at

    actions
  end

  filter :title, as: :string
  filter :status
  filter :is_priority

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :status, as: :select, collection: Post::STATUSES, include_blank: false
      f.input :is_priority
      f.rich_text_area :content, input_html: { rows: 90 }
    end
    f.actions
  end

  controller do
    def find_resource
      Post.friendly.find(params[:id])
    end

    def new
      redirect_to new_admin_custom_post_path
    end

    def edit
      redirect_to edit_admin_custom_post_path(id: params[:id])
    end
  end

end
