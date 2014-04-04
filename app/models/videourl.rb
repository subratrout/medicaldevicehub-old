class Videourl < ActiveRecord::Base

	belongs_to :manufacturer
	belongs_to :medicaldevice

	validates :medicaldevice_id, presence: true
	validates :title, :body_html, presence: true


	auto_html_for :body do
    	html_escape
    	image
    	youtube(:autoplay => false)
    	link :target => "_blank", :rel => "nofollow"
    	simple_format
  	end
end
