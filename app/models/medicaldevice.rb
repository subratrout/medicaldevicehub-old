class Medicaldevice < ActiveRecord::Base

  validates :description, presence: true
  validates :generic_name, :trade_name, presence: true

  validates_attachment :image, presence: true,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
  has_attached_file :image, styles: { medium: "320x240>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
end
