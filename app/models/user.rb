class User < ActiveRecord::Base
    validates( :name, presence: true )
    validates( :tel, presence: true, numericality: true, uniqueness: true )
    validates( :password, presence: true, confirmation: { allow_blank: true } )

    class << self
        def auth( tel, password )
            user = find_by( tel: tel )
            if( user && user.password == password )
                user
            else nil end
        end
    end
end
