class ChangeDataPetAddressToPet < ActiveRecord::Migration[6.1]
  def change
    change_column :pets, :pet_address, 'integer USING CAST(pet_address AS integer)'
  end
end
