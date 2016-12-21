class CompanyWorkController < ApplicationController
  before_action :authenticate_company!

  def index
    @cls = Worker.where(:company_id => current_company.id )
    @an = Announcament.where(:company_id => current_company.id)
  end
end
