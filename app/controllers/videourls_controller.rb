class VideourlsController < ApplicationController
  before_action :set_videourl, only: [:show, :edit, :update, :destroy]

  # GET /videourls
  # GET /videourls.json
  def index
    @videourls = Videourl.all
  end

  # GET /videourls/1
  # GET /videourls/1.json
  def show
    @videourl= @medicaldevice.videourls.first
  end

  # GET /videourls/new
  def new
    @videourl = Videourl.new
  end

  # GET /videourls/1/edit
  def edit
  end

  # POST /videourls
  # POST /videourls.json
  def create
    @medicaldevice = Medicaldevice.find(params[:id])
    @videourl = @medicaldeivce.Videourl.new(videourl_params)

    respond_to do |format|
      if @videourl.save
        format.html { redirect_to @videourl, notice: 'Videourl was successfully created.' }
        format.json { render action: 'show', status: :created, location: @videourl }
      else
        format.html { render action: 'new' }
        format.json { render json: @videourl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videourls/1
  # PATCH/PUT /videourls/1.json
  def update
    respond_to do |format|
      if @videourl.update(videourl_params)
        format.html { redirect_to @videourl, notice: 'Videourl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @videourl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videourls/1
  # DELETE /videourls/1.json
  def destroy
    @videourl.destroy
    respond_to do |format|
      format.html { redirect_to videourls_url }
      format.json { head :no_content }
    end
  end


  def preview
    videourl = Videourl.new(videourl_params)
    videourl.auto_html_prepare
    render :text => videourl.body_html
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_videourl
      @videourl = Videourl.find(params[:id])
    end

    def correct_videourl
      @videourl = correct_medicaldevice.videourls.find_by(id: params[:id])
      redirect_to videourls_path, notice: "Not authorized to edit this review" if @videourls.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def videourl_params
      params.require(:videourl).permit(:description, :body_html, :medicaldevice_id, :manufacturer_id, :title, :body)
    end
end
