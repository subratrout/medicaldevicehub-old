class AddSlugToMedicaldevices < ActiveRecord::Migration
  def change
    add_column :medicaldevices, :slug, :string
    add_index :medicaldevices, :slug, unique: true
  end
end
