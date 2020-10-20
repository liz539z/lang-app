class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :country

  with_options presence: true do
    validates :name
    validates :email, uniqueness: true
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'Password Include both letters and numbers' }
    validates :password_confirmation, presence: true
    validates :country_id, numericality: { other_than: 1 }
    validates :birthday
  end
end
