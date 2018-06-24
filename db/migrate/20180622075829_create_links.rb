class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.string :short, unique: true
      t.integer :count, default: 0

      t.timestamps
    end

    add_index :links, :short, unique: true
  end
end
