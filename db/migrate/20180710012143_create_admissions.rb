class CreateAdmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :admissions do |t|
      t.references      :chat_room
      t.references      :user

      t.timestamps
    end
  end
end
