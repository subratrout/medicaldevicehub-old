class CreateVideourls < ActiveRecord::Migration
  def change
    create_table :videourls do |t|
      t.string :description
      t.string :body_html
      t.references :medicaldevice
      t.references :manufacturer

      t.timestamps
    end
  end

  def down
  	drop_table :videourls
  end
end
