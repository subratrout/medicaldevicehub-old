ActiveAdmin.register Medicaldevice do
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
