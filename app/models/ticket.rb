class Ticket < ActiveRecord::Base
  validates( :kind, presence: true )
  validates( :total, presence: true, numericality: true )
  validates( :price, presence: true, numericality: true )
  belongs_to :event
end
