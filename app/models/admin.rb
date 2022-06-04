class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,<-管理者は一人しかいないため新規登録は不要
         :recoverable, :rememberable, :validatable
end
