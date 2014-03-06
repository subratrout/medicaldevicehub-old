ActiveAdmin.register Medicaldevice do
	permit_params :pmak_number, :applicant, :street1, :street2, :city, :state, :zip, :generic_name, :trade_name, :product_code, 
        :advisory_committee, :description, :image, :remove_image, :manufacturer_id
        
	index do
    	column :id
    	column :pmak_number
    	column :generic_name
    	column :trade_name
    	column :product_code
    	column :advisory_committee

    	default_actions
  	end
end
