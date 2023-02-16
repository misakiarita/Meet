class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.text :evaluation_comment
      t.integer :organization_user_id
      t.integer :point, null: false
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
    add_index :evaluations, :organization_user_id
  end
end

