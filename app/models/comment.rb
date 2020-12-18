class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :post, presence: true

end
