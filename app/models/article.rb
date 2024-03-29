class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 },uniqueness: true
  validates :body, presence: true, length: {minimum: 50}
end
