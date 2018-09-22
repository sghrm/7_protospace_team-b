class Like < ActiveRecord::Base
	belongs_to :prototype, counter_cache: :likes_count
	belongs_to :user
	validates :user_id, {presence: true}
	validates :prototype_id, {presence: true}
end
