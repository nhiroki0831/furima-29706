class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname,      presence: true
  validates :first_name,    presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ ,message: "は全角で入力してください" }
  validates :family_name,   presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ ,message: "は全角で入力してください"}
  validates :family_name_k, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ ,message: "は全角で入力してください"}
  validates :first_name_k,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ ,message: "は全角で入力してください"}
  validates :birthday,      presence: true
end
