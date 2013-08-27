class CreateMedicaldevices < ActiveRecord::Migration
  def self.up
    create_table :medicaldevices do |t|
      t.text :pmak_number
      t.text :applicant
      t.text :street1
      t.text :street2
      t.text :city
      t.text :state
      t.text :zip
      t.text :generic_name
      t.text :trade_name
      t.text :product_code
      t.text :advisory_committee
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :medicaldevices
  end
end
