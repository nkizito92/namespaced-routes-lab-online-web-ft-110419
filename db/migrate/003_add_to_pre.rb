class AddToPre < ActiveRecord::Migration[5.0]
    add_column :preferences, :allow_create_songs, :boolean
    
end