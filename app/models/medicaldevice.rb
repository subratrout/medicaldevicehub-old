class Medicaldevice < ActiveRecord::Base



	belongs_to :manufacturer
	has_many :device_reviews

	mount_uploader :image, ImageUploader


	include PgSearch
	pg_search_scope :search, :against => [ :generic_name, :trade_name, :description, :applicant],
	using: [tsearch: {dictionary: "english"}],
	ignoring: :accents

	def self.text_search(query)
		if query.present?
			rank = <<-RANK
      			ts_rank(to_tsvector(generic_name), plainto_tsquery(#{sanitize(query)})) +
      			ts_rank(to_tsvector(trade_name), plainto_tsquery(#{sanitize(query)}))+
      			ts_rank(to_tsvector(description), plainto_tsquery(#{sanitize(query)})) +
      			ts_rank(to_tsvector(applicant), plainto_tsquery(#{sanitize(query)})) 
    		RANK


    	where("to_tsvector('english', generic_name) @@ plainto_tsquery(:q) or to_tsvector('english', trade_name) @@ plainto_tsquery(:q) or to_tsvector('english', description) @@ plainto_tsquery(:q) or to_tsvector('english', applicant)@@ plainto_tsquery(:q)", q: query).order("#{rank} DESC")
			
		else
			all
		end
	end

	#def self.search(search)

		#if search
	  		#find(:all, :conditions => ['generic_name LIKE ?', "%#{search}%"])
	  #	else
	  		# @medicaldevices = Medicaldevice.limit(40)
	  #	end
	# end




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
