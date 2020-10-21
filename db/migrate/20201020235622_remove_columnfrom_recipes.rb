class RemoveColumnfromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :user_id, :integer
  end
end
