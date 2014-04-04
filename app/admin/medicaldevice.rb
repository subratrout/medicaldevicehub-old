ActiveAdmin.register Medicaldevice do
	permit_params :pmak_number, :applicant, :street1, :street2, :city, :state, :zip, :generic_name, :trade_name, :product_code, 
        :advisory_committee, :description, :image, :remove_image, :manufacturer_id, :slug


        before_filter do
            Medicaldevice.class_eval do
                def to_param
                    id.to_s
                end
            end
        end
        
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
