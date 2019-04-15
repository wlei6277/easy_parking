class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.text :location
      t.integer :spaces
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
