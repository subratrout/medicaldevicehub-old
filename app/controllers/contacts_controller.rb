class ContactsController < ApplicationController
	
	def new
	 @contact = Contact.new
	end
	
	def create
	  @contact = Contact.new(secure_params)
		  if @contact.valid?
			# TODO save data
			@contact.update_spreadsheet
			# TODO send message
			  flash[:notice] = "Thank you for your message #{@contact.name}. We will contact you soon if needed."
			  redirect_to root_path
		  else
			render :new
		end
	end
	

	private
	
	def secure_params
	  params.require(:contact).permit(:name, :email, :content)
	end
end