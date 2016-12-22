class AnnouncamentsController < ApplicationController
  before_action :set_announcament, only: [:show, :edit, :update, :destroy]

  # GET /announcaments
  # GET /announcaments.json
  def index
    @announcaments = Announcament.all
  end

  # GET /announcaments/1
  # GET /announcaments/1.json
  def show
    @owner = false
    @skills = Announcament.find(params[:id]).skill
    @seasons = Announcament.find(params[:id]).season
    if @announcament.worker_id
      @auth = Worker.find(@announcament.worker_id);
      if worker_signed_in?
        if current_worker.id == @announcament.worker_id
          @owner = true
        end
      end
    elsif @announcament.company_id
      @auth = Company.find(@announcament.company_id);
      if company_signed_in?
        if current_company.id == @announcament.company_id
          @owner = true
        end
      end
    end
  end

  # GET /announcaments/new
  def new
    if !(company_signed_in? || worker_signed_in?)
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @announcament = Announcament.new
      if company_signed_in?

        # company'nin oluşturduğu tüm season'ları getirir.
        @seasons = Season.where(:worker_id => Worker.where(:company_id => current_company.id).ids)
        @s = Worker.where(:company_id => current_company.id).ids[0]
      elsif worker_signed_in?
         @seasons = Season.where(:worker_id => current_worker.id)
      elsif member_signed_in?
        if @announcament.worker_id
          @auth = Worker.find(@announcament.worker_id);
        elsif @announcament.company_id
          @auth = Company.find(@announcament.company_id);
        end
      end
    end
  end

  # GET /announcaments/1/edit
  def edit
    if !(company_signed_in? || worker_signed_in?)
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      if company_signed_in?
        @seasons = Season.where(:worker_id => Worker.where(:company_id => current_company.id).ids)
        @s = Worker.where(:company_id => current_company.id).ids[0]
      elsif worker_signed_in?
        @seasons = Season.where(:worker_id => current_worker.id)
      end
    end
  end

  # POST /announcaments
  # POST /announcaments.json
  def create
    @announcament = Announcament.new(announcament_params)

    respond_to do |format|
      if @announcament.save
        format.html { redirect_to @announcament, notice: 'Announcament was successfully created.' }
        format.json { render :show, status: :created, location: @announcament }
      else
        format.html { render :new }
        format.json { render json: @announcament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcaments/1
  # PATCH/PUT /announcaments/1.json
  def update
    respond_to do |format|
      if @announcament.update(announcament_params)
        format.html { redirect_to @announcament, notice: 'Announcament was successfully updated.' }
        format.json { render :show, status: :ok, location: @announcament }
      else
        format.html { render :edit }
        format.json { render json: @announcament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcaments/1
  # DELETE /announcaments/1.json
  def destroy
    if !(company_signed_in? || worker_signed_in?)
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @announcament.destroy
      respond_to do |format|
        format.html { redirect_to announcaments_url, notice: 'Announcament was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcament
      @announcament = Announcament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcament_params
      params.require(:announcament).permit(:city, :body, :title, :company_id, :worker_id, :skill_ids => [], :season_ids => [])
    end
end
