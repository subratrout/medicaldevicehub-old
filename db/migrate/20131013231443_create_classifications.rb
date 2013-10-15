class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :review_panel
      t.string :medical_speciality
      t.string :product_code
      t.string :device_generic_name
      t.string :device_class
      t.string :unclassified_reason_code
      t.string :gmp_exempt_flag
      t.string :third_party_review_eligible
      t.string :third_party_review_code
      t.string :regulation_number
      t.string :submission_type_id
      t.text :definition
      t.text :physical_state
      t.text :technical_method
      t.text :target_area

      t.timestamps
    end
    add_index :classifications, :medical_speciality
    add_index :classifications, :product_code
    add_index :classifications, :device_generic_name
    add_index :classifications, :unclassified_reason_code
    add_index :classifications, :third_party_review_code
    add_index :classifications, :regulation_number
  end
end
