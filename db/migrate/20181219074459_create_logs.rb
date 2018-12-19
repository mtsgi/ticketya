class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :ticket_id ,null: false # チケットID
      t.integer :user_id ,null: false # ユーザID
      t.integer :quantity ,null: false # 枚数

      t.timestamps null: false
    end

    add_index :logs, :ticket_id
    add_index :logs, :user_id

  end
end
