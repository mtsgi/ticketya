class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false # 氏名 
      t.string :tel ,null: false # 電話番号
      t.string :password, null: false # パスワード
      t.boolean :admin , null: false, default: false # 管理者フラグ
      
      t.timestamps null: false
    end
  end
end