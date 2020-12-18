class Article < ApplicationRecord
  has_rich_text :content
  has_one_attached :image

  belongs_to :user
  has_many :comments, dependent: :destroy
end
