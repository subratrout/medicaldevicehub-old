ActiveAdmin.register Classification do

	index do
    	column :medical_speciality
    	column :product_code
    	column :device_generic_name
    	column :device_class
    	column :target_area
    	column :definition

    	default_actions
  	end

end
