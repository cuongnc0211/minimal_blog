module PostHelper
  include Pagy::Frontend

  def est_read_time(post)
    return unless post.present?

    "~ #{post.estimated_reading_time} min read"
  end
end
