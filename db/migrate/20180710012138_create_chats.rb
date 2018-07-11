class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.references      :user
      t.references      :chat_room
      
      t.text            :message

      t.timestamps
    end
  end
end
