class AddDeletedToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :deleted, :boolean, default: false
  end
end
