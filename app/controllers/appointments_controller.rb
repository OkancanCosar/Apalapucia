class AppointmentsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = current_member.appointment
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @sea = Season.find(@appointment.season_id)
    @me = Member.find(@appointment.member)
    @ans = Announcament.find(@appointment.announcament)

  end

  # GET /appointments/new
  def new
      @appointment = Appointment.new
      if !params[:an_id]
        render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
      else

        @nbr = Announcament.find(params[:an_id]).season
        @teyteyteytey = [];
        @nbr.each do |seas|
          @nbrc =  ActiveRecord::Base.connection.execute(
                      "SELECT season_id FROM announcaments_seasons
                       WHERE announcament_id='#{params[:an_id]}' AND season_id='#{seas.id}' AND availability='true'")
          @nbrc.each do |a|
            @teyteyteytey.push(  a["season_id"]   )
          end
        end
        @seasonss = Season.find(@teyteyteytey)
        if @seasonss.length > 0
          @a = true;
        else
          @a = false;
        end
      end
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Randevu başarılı bir şekilde olluşturuldu.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Randevu başarılı bir şekilde güncellendi' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
      @appointment.destroy
      respond_to do |format|
        format.html { redirect_to appointments_url, notice: 'Randevu başarılı bir şekilde kaldırıldı.' }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:body, :season_id, :member_id, :announcament_id)
    end
end
