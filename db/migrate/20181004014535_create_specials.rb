class CreateSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :specials do |t|
      t.text :name
      t.integer :run_time_length #time in minutes
      t.text :image_url
      t.integer :year
      t.integer :comedian_id
      
      t.timestamps null: false
    end
  end
end
