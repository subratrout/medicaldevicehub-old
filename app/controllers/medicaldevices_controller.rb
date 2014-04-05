class MedicaldevicesController < ApplicationController
  before_action :set_medicaldevice, only: [:show, :edit, :update]
  before_action :authenticate_manufacturer!, except: [:index, :show]

  # GET /medicaldevices
  # GET /medicaldevices.json
  def index
    @medicaldevices = Medicaldevice.limit(40)
    @medicaldevices = Medicaldevice.text_search(params[:query]).page(params[:page])
    @uploader = Medicaldevice.new.image
    @uploader.success_action_redirect = @medicaldevice
  end

  # GET /medicaldevices/1
  # GET /medicaldevices/1.json
  def show
    @medicaldevice = Medicaldevice.find(params[:id])
    @device_review= DeviceReview.new(:medicaldevice => @medicaldevice)
    @device_review.user= current_user
    current_medicaldevice = @medicaldevice
    @videourls = @medicaldevice.videourls
    device_reviews= @medicaldevice.device_reviews
    @similar_devices= Medicaldevice.similar_devices(@medicaldevice).limit(10)
  end

  # GET /medicaldevices/new
  def new
    @medicaldevice = Medicaldevice.new
    @medicaldevices = Medicaldevice.new(key: params[:key])
    @videourl = @medicaldeivce.Videourl.new(videourl_params)
  end

  # GET /medicaldevices/1/edit
  def edit
    @medicaldevice = Medicaldevice.find(params[:id])
    @videourl = @medicaldeivce.Videourl.new(videourl_params)
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

    def correct_manufacturer
      @medicaldevice = correct_manufacturer.medicaldevices.find_by(id: params[:id])
      redirect_to medicaldevices_path, notice: "Not authorized to edit this medicaldevice" if @medicaldevice.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicaldevice_params
      params.require(:medicaldevice).permit(:pmak_number, :applicant, :street1, :street2, :city, :state, :zip, :generic_name, :trade_name, :product_code, 
        :advisory_committee, :description, :image, :remove_image, :manufacturer_id, :slug)
    end

    def set_videourl
      @videourl = Videourl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def videourl_params
      params.require(:videourl).permit(:description, :body_html, :medicaldevice_id, :manufacturer_id, :title, :body)
    end
end
