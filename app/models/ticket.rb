class Ticket < ActiveRecord::Base
  validates( :kind, presence: { message: "席種を入力してください。" } )
  validates( :total, presence: { message: "総数を入力してください。" }, numericality: { message: "総数は数字を入力してください" } )
  validates( :price, presence: { message: "単価を入力してください。" }, numericality: { message: "単価は数字を入力してください。" } )
  belongs_to :event
end
