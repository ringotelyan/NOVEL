class Room < ApplicationRecord

  has_many :chats
  has_many :user_rooms # １つのルームにいるユーザー数は２人のためhas_manyになる
end
