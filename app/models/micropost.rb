class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :retweeted_micropost, class_name: 'Micropost', foreign_key: 'retweeted_id'
end
