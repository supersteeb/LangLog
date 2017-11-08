class Test < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  enum test_type: {chinese_english: 0, english_chinese: 1, chinese_pinyin: 2}
end
