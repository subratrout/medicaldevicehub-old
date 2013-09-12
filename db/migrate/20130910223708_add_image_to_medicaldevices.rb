class AddImageToMedicaldevices < ActiveRecord::Migration
  def change
    add_column :medicaldevices, :image, :string
  end
end
