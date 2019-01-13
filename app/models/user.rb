class User < ActiveRecord::Base
    validates( :name, presence: { message: "名前を入力してください。" } )
    validates( :tel, presence: { message: "電話番号を入力してください。" }, numericality: { message: "電話番号の形式が間違っています。" }, uniqueness: { message: "その電話番号はすでに登録されています。" } )
    validates( :password, presence: { on: :create, message: "パスワードを入力してください。" }, confirmation: { allow_blank: true, message: "パスワード確認が間違っています。" } )

    class << self
        def auth( tel, password )
            user = find_by( tel: tel )
            if( user && user.password == password )
                user
            else nil end
        end
    end
end
