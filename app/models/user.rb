class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
            validates :email
            validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Input half-width characters." }
            validates :nickname
            validates :favorite_team
            validates :favorite_player
            validates :birthday
         end
         has_many :matches, dependent: :destroy
         has_many :comments

end
