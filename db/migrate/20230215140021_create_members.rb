class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.references :conversation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :members, [:user_id, :conversation_id], unique: true  
  end
end
