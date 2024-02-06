module ApplicationHelper
  include Pagy::Frontend

  def default_author
    'Cuong Nguyen'
  end

  def default_author_avatar
    'https://res.cloudinary.com/dspnlt8se/image/upload/v1707209294/illustrations/profiles/dntgy076b5xts8jnyhhh.png'
  end
end
