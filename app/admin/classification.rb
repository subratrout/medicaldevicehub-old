ActiveAdmin.register Classification do

permit_params :medical_speciality, :product_code, :device_generic_name, :device_class, :target_area, :definition

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
