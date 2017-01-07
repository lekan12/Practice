class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.string :title
      t.text :description
      t.string :author

      t.timestamps null: false
    end
  end
end
