class DeviceReview < ActiveRecord::Base
	validates :user, presence: true
	validates :medicaldevice, presence: true
	validates :content, presence: true, length: {minimum: 4}

	belongs_to :medicaldevice
	belongs_to :user
end
