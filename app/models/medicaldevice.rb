class Medicaldevice < ActiveRecord::Base


	#belongs_to :manufacturer

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




#	after_save :enqueue_image
  
  def image_name
    File.basename(image.path || image.filename) if image
  end

 # def enqueue_image
 #   ImageWorker.perform_async(id, key) if key.present?
 # end

  class ImageWorker
    include Sidekiq::Worker
    
    def perform(id, key)
      medicaldevice = Medicaldevice.find(id)
      medicaldevice.key = key
      medicaldevice.remote_image_url = medicaldevice.image.direct_fog_url(with_path: true)
      medicaldevice.save!
      medicaldevice.update_column(:image_processed, true)
    end
  end

end
