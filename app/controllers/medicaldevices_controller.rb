class MedicaldevicesController < ApplicationController
  before_action :set_medicaldevice, only: [:show, :edit, :update, :destroy]

  # GET /medicaldevices
  # GET /medicaldevices.json
  def index
    @medicaldevices = Medicaldevice.limit(40)
  end

  # GET /medicaldevices/1
  # GET /medicaldevices/1.json
  def show
  end

  # GET /medicaldevices/new
  def new
    @medicaldevice = Medicaldevice.new
  end

  # GET /medicaldevices/1/edit
  def edit
  end

  # POST /medicaldevices
  # POST /medicaldevices.json
  def create
    @medicaldevice = Medicaldevice.new(medicaldevice_params)

    respond_to do |format|
      if @medicaldevice.save
        format.html { redirect_to @medicaldevice, notice: 'Medicaldevice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medicaldevice }
      else
        format.html { render action: 'new' }
        format.json { render json: @medicaldevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicaldevices/1
  # PATCH/PUT /medicaldevices/1.json
  def update
    respond_to do |format|
      if @medicaldevice.update(medicaldevice_params)
        format.html { redirect_to @medicaldevice, notice: 'Medicaldevice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medicaldevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicaldevices/1
  # DELETE /medicaldevices/1.json
  def destroy
    @medicaldevice.destroy
    respond_to do |format|
      format.html { redirect_to medicaldevices_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicaldevice
      @medicaldevice = Medicaldevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicaldevice_params
      params.require(:medicaldevice).permit(:pmak_number, :applicant, :street1, :street2, :city, :state, :zip, :generic_name, :trade_name, :product_code, :advisory_committee, :description, :image, :remove_image)
    end
end
