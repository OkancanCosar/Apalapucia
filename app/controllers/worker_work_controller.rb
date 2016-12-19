class WorkerWorkController < ApplicationController
  before_action :authenticate_worker!

  def index
    @yetenekler = current_worker.skills
    @firm = Company.find(current_worker.company_id)
    @ilanlar = Announcament.where(:worker_id => current_worker.id)
  end
end
