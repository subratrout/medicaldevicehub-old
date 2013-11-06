class CreateDeviceReviews < ActiveRecord::Migration
  def self.up
    create_table :device_reviews do |t|
      t.text :content
      t.references :user
      t.references :medicaldevice

      t.timestamps
    end

    add_index :device_reviews, :medicaldevice_id
    add_index :device_reviews, :user_id
    add_index :device_reviews, :content
  end

  def self.down
  	drop_table :device_reviews
  	remove_index :device_reviews, :medicaldevice_id
  	add_index :device_reviews, :user_id
    remove_index :device_reviews, :content
  end
end
