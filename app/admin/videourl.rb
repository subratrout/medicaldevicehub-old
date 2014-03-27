ActiveAdmin.register Videourl do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  permit_params :description, :body_html, :medicaldevice_id, :manufacturer_id, :title, :body

  index do
    column :id
    column :description
    column :medicaldevice_id
    column :manufacturer_id
    column :title
    column :body

    default_actions
    end
end
