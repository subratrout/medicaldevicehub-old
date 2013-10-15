class AddManufacturerIdToMedicaldevices < ActiveRecord::Migration
  def change
    add_column :medicaldevices, :manufacturer_id, :integer
    add_index :medicaldevices, :manufacturer_id
  end
end
