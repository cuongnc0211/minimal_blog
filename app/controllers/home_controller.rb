class HomeController < ApplicationController
  def index
    @work_epxs = WorkExp.all.order('created_at DESC')
    @educations = Education.all.order('created_at DESC')
  end
end
