class DeviceReviewsController < ApplicationController

  before_filter :authenticate_user!

  def index

    @device_reviews = DeviceReview.limit(40)
    @device_reviews = DeviceReview.text_search(params[:query]).page(params[:page])
    @uploader = DeviceReview.new.image
    @uploader.success_action_redirect = @device_review
  end

  # GET /DeviceReviews/1
  # GET /DeviceReviews/1.json
  def show
  	@medicaldevice = Medicaldevice.find(params[:id])
    @device_review = DeviceReview.find(params[:id])
    @device_reviews = @medicaldevice.device_review
    @device_reviews = DeviceReview.new(key: params[:id])
    @videourls = @medicaldevice.videourl
    @videourls = Videourl.find(videourl_params)
  end

  # GET /DeviceReviews/new
  def new
  	@medicaldevice = Medicaldevice.find(params[:medicaldevice_id])
    @device_review = @medicaldevice.DeviceReview.new
  end

  # GET /DeviceReviews/1/edit
  def edit
    #@device_review = DeviceReview.find(params[:id])
    #@uploader = DeviceReview.new.image
    #@uploader.success_action_redirect = @device_review
  end

  # POST /DeviceReviews
  # POST /DeviceReviews.json
  def create
  	@medicaldevice = Medicaldevice.find(params[:device_review][:medicaldevice_id])

  
    @device_review = @medicaldevice.device_reviews.create(device_review_params) if signed_in?
    @device_review.user = current_user
    #puts device_review_params
    #puts @device_review.inspect

   respond_to do |format|
        if @device_review.save
          format.html { redirect_to @medicaldevice, notice: 'Review for device was successfully created.' }
          format.json { render action: 'show', status: :created, location: @device_review }
        else
          format.html{render action: 'new'}
        end         
      end
    end
 

  # PATCH/PUT /DeviceReviews/1
  # PATCH/PUT /DeviceReviews/1.json
  def update
    respond_to do |format|
      if @device_review.update(device_review_params)
        format.html { redirect_to @device_review, notice: 'device_review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @device_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /DeviceReviews/1
  # DELETE /DeviceReviews/1.json
  def destroy
    @device_review.destroy
    respond_to do |format|
      format.html { redirect_to device_reviews_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_review
      @device_reviews = DeviceReview.find(params[:id])
    end

    def correct_device_review
      @device_review = correct_user.device_reviews.find_by(id: params[:id])
      redirect_to device_reviews_path, notice: "Not authorized to edit this review" if @device_review.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_review_params
      params.require(:device_review).permit(:content, :user_id, :medicaldevice_id)
    end
end
