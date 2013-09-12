class Medicaldevice < ActiveRecord::Base


	belongs_to :manufacturer

	mount_uploader :image, ImageUploader


	include PgSearch
	pg_search_scope :search, :against => [:applicant, :generic_name, :trade_name, :description],
	using: {tsearch: {dictionary: "english"}},
	ignoring: :accents

	def self.text_search(search)
		if search.present?
			where("generic_name @@ :s or trade_name @@ :s or description @@ :s or applicant @@ :s", s: search)
		else
			all
		end
	end

	def self.search(search)

		if search
	  		find(:all, :conditions => ['generic_name LIKE ?', "%#{search}%"])
	  	else
	  		@medicaldevices = Medicaldevice.limit(40)
	  	end
	end
end
