class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
  has_many :prototypes
  has_many :comments
  
end
