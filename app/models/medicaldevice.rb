class Medicaldevice < ActiveRecord::Base
  extend FriendlyId
  friendly_id :trade_or_generic_name, use: :slugged

	validates :trade_name, :uniqueness => true
	validates :applicant, :presence => true
	validates_presence_of :trade_name, :unless => :generic_name?

	belongs_to :manufacturer
	has_many :device_reviews, :dependent => :destroy
  has_many :videourls, :dependent => :destroy

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

  def trade_or_generic_name
    if 
      trade_name ==''
      "#{id}-#{generic_name}"
    else
      "#{trade_name}"
    end
    save!
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end
  
  def slug_candidates
    [
      :trade_name,
      [:trade_name, :generic_name]
    ]
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
