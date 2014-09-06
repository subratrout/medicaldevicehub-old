class PagesController < ApplicationController


	def index
		#@medicaldevices =Medicaldevice.text_search(params[:search]).limit(20)
		@medicaldevices =Medicaldevice.limit(100)
    	@medicaldevices = Medicaldevice.text_search(params[:query]).page(params[:page])
    	@uploader = Medicaldevice.new.image
    	@uploader.success_action_redirect = @medicaldevice
	end

	  def home
	  	@medicaldevices =Medicaldevice.text_search(params[:search]).limit(40)
	  	@medicaldevices =Medicaldevice.limit(100)	
	  end

	  def about
	  end

	  def show
	  	@medicaldevices =Medicaldevice.text_search(params[:search]).limit(20)
	  end

	  def search_results
	  	results= Post.text_search(search)
	  end




	  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicaldevice
      @medicaldevice = Medicaldevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicaldevice_params
      params.require(:medicaldevice).permit(:pmak_number, :applicant, :street1, :street2, :city, :state, :zip, :generic_name, :trade_name, :product_code, :advisory_committee, :description,:image)
    end
end

