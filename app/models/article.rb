class Article < ApplicationRecord
  has_one_attached :thumbnail
  validates_presence_of :title
end
