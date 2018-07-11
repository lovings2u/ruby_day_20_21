class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :admissions
  has_many :chat_rooms, through: :admissions
  has_many :chats
  
  def joined_room?(room)
    self.chat_rooms.include?(room)
  end
  
  def is_room_master?(room)
    self.email.eql?(room.master_id)
  end
end
