class HomeController < ApplicationController
  def index

  end

  def ilanlar

    if params[:compID]
      @announcaments = Announcament.where(:company_id => params[:compID])
    elsif params[:skillID]
      @announcaments = Skill.find( params[:skillID] ).announcament
    end





  end
end
