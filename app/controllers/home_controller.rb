class HomeController < ApplicationController
  def index
    @comp = Company.all.order('created_at ASC').limit(3)
    @ans = Announcament.all.order("created_at DESC").limit(5)
    @comporder = Company.all.order("created_at DESC").limit(3)
    @s = Skill.all
  end

  def ilanlar

    if params[:compID]
       @at = 1;
       @announcaments = Announcament.where(:company_id => "#{params[:compID]}")
    elsif params[:skillID]
       @at = 1;
       @announcaments = Skill.find("#{params[:skillID]}").announcament
    elsif params[:search].length > 2
      @at = 2;
      @asd = "%#{params[:search]}%";
      @sss = params[:search];

      # Search4Announcement
      @Search4Announcement = Announcament.where("lower(title) like lower(?) OR body LIKE lower(?)", @asd, @asd)

      # Search4Company
      @kamp = Company.where("lower(name) like lower(?)", @asd )
      if @kamp
         @Search4Company = Announcament.where(:company_id => @kamp.ids)
      end

      # Search4Skill
      @skl = Skill.where("lower(name) like lower(?)", @asd ).first
      if @skl
        @Search4Skill = @skl.announcament
      end
    end
  end
end
