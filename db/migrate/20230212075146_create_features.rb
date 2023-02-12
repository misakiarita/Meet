class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.integer :dog_or_cat
      t.string :color
      t.integer :weight
      t.integer :pet_age
      t.text :note
      t.integer :sex

      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
