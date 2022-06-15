class CreateViewCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :view_counts do |t|
      t.integer :novel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
