class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :pet_name
      t.string :pet_address
      t.integer :qualify_age
      t.integer :status
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
