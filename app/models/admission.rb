class Admission < ApplicationRecord
    belongs_to :user
    belongs_to :chat_room, counter_cache: true
    
    after_commit :user_join_chat_room_notification, on: :create
    after_commit :user_exit_chat_room_notification, on: :destroy
    
    def user_join_chat_room_notification
        Pusher.trigger("chat_room_#{self.chat_room_id}", 'join', self.as_json.merge({email: self.user.email}))
        Pusher.trigger("chat_room", "join", self.as_json) 
    end
    
    def user_exit_chat_room_notification
        Pusher.trigger("chat_room_#{self.chat_room_id}", 'exit', self.as_json.merge({email: self.user.email}))
        Pusher.trigger("chat_room", "exit", self.as_json) 
    end
end
