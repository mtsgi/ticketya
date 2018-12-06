class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :pref, null: false
      t.string :area ,null: false
      t.timestamps null: false
    end
  end
end