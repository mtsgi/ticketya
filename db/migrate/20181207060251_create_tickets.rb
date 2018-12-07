class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      #t.references :event, index: true, foreign_key: true
      t.integer :event_id ,null: false # ライブID
      t.string :kind ,null: false # 種類
      t.integer :price ,null: false # 値段
      t.integer :total ,null: false # 合計枚数

      t.timestamps null: false
    end
    add_index :tickets, :event_id
  end
end
