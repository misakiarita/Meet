class CreatePetpics < ActiveRecord::Migration[6.1]
  def change
    create_table :petpics do |t|
      t.text :picture
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
