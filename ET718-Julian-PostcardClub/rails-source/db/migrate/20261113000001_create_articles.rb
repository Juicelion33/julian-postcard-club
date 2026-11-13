class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :region, null: false
      t.string :destination, null: false
      t.string :trip_status, null: false
      t.timestamps
    end
    add_index :articles, :region
  end
end
