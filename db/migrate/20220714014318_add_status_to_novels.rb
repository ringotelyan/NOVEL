class AddStatusToNovels < ActiveRecord::Migration[6.1]
  def change
    add_column :novels, :status, :integer, default: 0, null: false
  end
end
