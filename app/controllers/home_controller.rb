class HomeController < ApplicationController
  def index
    @work_epxs = WorkExp.all.order('created_at DESC')
    @educations = Education.all.order('created_at ASC')
    @skills = Skill.all.order('created_at ASC')
  end

  def resume
    @work_epxs = WorkExp.all.order('created_at DESC')
    @educations = Education.all.order('created_at ASC')
    @skills = Skill.all.order('created_at ASC')
  end
end
