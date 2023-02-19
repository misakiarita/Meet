class ChangeDataFeatureDogOrCat < ActiveRecord::Migration[6.1]
  def change
    change_column :features, :dog_or_cat, :string
  end
end
