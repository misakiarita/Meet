class ChangeDataAddressToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :address, 'integer USING CAST(address AS integer)'
  end
end
