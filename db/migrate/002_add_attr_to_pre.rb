class AddAttrToPre < ActiveRecord::Migration[5.0]
    add_column :preferences, :allow_create_artists, :boolean
    
end