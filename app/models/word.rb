class Word < ApplicationRecord
  belongs_to :user, :dependent => :destroy

  validates :chinese, presence: true, uniqueness: {case_sensitive: false}
	validates :english, presence: true

	def self.search(search)
		where("chinese LIKE ? OR english LIKE ? OR pinyin LIKE ? OR part_of_speech LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
		#where("character LIKE ?", "%#{search}%")
		#where("pinyin LIKE ?", "%#{search}%")
		#where("part_of_speech LIKE ?", "%#{search}%")
	end
end
