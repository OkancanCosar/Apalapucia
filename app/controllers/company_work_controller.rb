class CompanyWorkController < ApplicationController
  before_action :authenticate_company!

  def index
    @cls = Worker.where({
      :company_id => current_company.id,
      :confirmation => true
      })
    @an = Announcament.where(:company_id => current_company.id)
    @wp = Workerpool.where({
       :company_id => current_company.id,
       :status => false
      })
  end

    def registered
      @w = Worker.find(params[:a])
      @w.update(confirmation: true)

      @workerpl = Workerpool.find(params[:b])
      @workerpl.update(status: true)
      redirect_to company_work_path
    end

    def unregistered
      @w = Worker.find(params[:w])
      @w.update(confirmation: false)

      @workerpl = Workerpool.where( :worker_id => params[:w])
      @workerpl.update(status: false)

       redirect_to company_work_path

    end




end
