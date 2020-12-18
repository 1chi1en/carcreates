class User < ApplicationRecord
  PASSWORD = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze #英数字混合

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  with_options presence: true do

    validates :nickname
    validates :password, format: { with: PASSWORD }
  end

end
