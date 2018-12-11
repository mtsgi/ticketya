class User < ActiveRecord::Base
    validates( :name, presence: true )
    validates( :tel, presence: true, numericality: true, uniqueness: true )
    validates( :password, presence: true, confirmation: { allow_blank: true } )
end
