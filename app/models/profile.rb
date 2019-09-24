class Profile < ApplicationRecord
  validates :name, presence: true
  validates :twitter_url, presence: true
end
