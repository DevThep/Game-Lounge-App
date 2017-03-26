class Game < ApplicationRecord
	has_many :topics, dependent: :destroy
	validates :name, presence: true, length: { maximum: 155 }
	validates :publisher, presence: true, length: { maximum: 155 }
	validates :description, presence: true, length: { maximum: 512 }
	validates :picture, presence: true
	mount_uploader :picture, PictureUploader

	private
  	def picture_size
  		if picture.size > 5.megabytes
        	errors.add(:picture, "should be less than 5MB")
      	end
  	end
end
