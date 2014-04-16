class CreateTables < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.string :city
      t.string :state
      t.decimal :average_rating
      t.integer :price
      t.integer :user_id
      t.timestamps
    end
    create_table :ratings do |t|
      t.integer :score
      t.text :review
      t.integer :user_id
      t.integer :property_id
      t.timestamps
    end
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :property_id
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
    create_table :pictures do |t|
      t.integer :property_id
      t.attachment :image
    end
    add_column :users, :name, :string
  end
end
