class AddAttachmentImageToMedicaldevices < ActiveRecord::Migration
  def self.up
    change_table :medicaldevices do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :medicaldevices, :image
  end
end
