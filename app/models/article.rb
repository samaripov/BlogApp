class Article < ApplicationRecord
  validates_presence_of :title
  has_one_attached :thumbnail
  has_rich_text :body
end
