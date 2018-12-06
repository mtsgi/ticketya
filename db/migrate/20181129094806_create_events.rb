class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string( :name, null: false )
      t.string( :artist, null: false )
      t.integer( :place_id, null: false )
      t.date( :date, null: false )
      t.string( :comment )
      t.boolean( :available, null: false, default: true )
      t.string( :hall, null: false )
      t.timestamps( null: false )
    end
  end
end
