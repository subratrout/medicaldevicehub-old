class AddSearchIndexToMedicaldevices < ActiveRecord::Migration
 
 def up
    execute "create index generic_name on medicaldevices using gin(to_tsvector('english', generic_name))"
    execute "create index trade_name on medicaldevices using gin(to_tsvector('english', trade_name))"
    execute "create index description on medicaldevices using gin(to_tsvector('english', description))"
    execute "create index applicant on medicaldevices using gin(to_tsvector('english', applicant))"
  end

  def down
    execute "drop index generic_name"
    execute "drop index trade_name"
    execute "drop index description"
    execute "drop index applicant"
  end

end
