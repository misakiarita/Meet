class ChangeDatatypeDogOrCatOfFeatures < ActiveRecord::Migration[6.1]
  def change
    change_column :features, :dog_or_cat, 'integer USING CAST(dog_or_cat AS integer)'
  end
end
