class Link < ApplicationRecord
	REGEX_URL = /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9]\.[^\s]{2,})/
	validates :url, presence: true, format: {with: REGEX_URL}
	after_create :generate_short
	default_scope -> {order("created_at DESC")}

	private
	
	def generate_short
		update_attribute(:short, id.to_s(36))
	end
end
