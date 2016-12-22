class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :edit, :update, :destroy]

  before_filter do
    if !(company_signed_in? || worker_signed_in?)
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

  # GET /seasons
  # GET /seasons.json
  def index
    if company_signed_in?
      @owner = Worker.where(:company_id => current_company.id)[0]
      @seasons = @owner.seasons
    else
      @seasons = current_worker.seasons
    end
  end

  # GET /seasons/1
  # GET /seasons/1.json
  def show
  end

  # GET /seasons/new
  def new
    @season = Season.new

    if company_signed_in?
        @owner = Worker.where(:company_id => current_company.id)[0]
    else
        @owner = current_worker.id
    end

  end

  # GET /seasons/1/edit
  def edit
    if company_signed_in?
        @owner = Worker.where(:company_id => current_company.id)[0]
    else
        @owner = current_worker.id
    end
  end

  # POST /seasons
  # POST /seasons.json
  def create
    @season = Season.new(season_params)

    respond_to do |format|
      if @season.save
        format.html { redirect_to @season, notice: 'Season was successfully created.' }
        format.json { render :show, status: :created, location: @season }
      else
        format.html { render :new }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seasons/1
  # PATCH/PUT /seasons/1.json
  def update
    respond_to do |format|
      if @season.update(season_params)
        format.html { redirect_to @season, notice: 'Season was successfully updated.' }
        format.json { render :show, status: :ok, location: @season }
      else
        format.html { render :edit }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasons/1
  # DELETE /seasons/1.json
  def destroy
    @season.destroy
    respond_to do |format|
      format.html { redirect_to seasons_url, notice: 'Season was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def season_params
      params.require(:season).permit(:start_date, :end_date, :worker_id)
    end
end
