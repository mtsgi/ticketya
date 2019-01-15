class Event < ActiveRecord::Base
    validates( :name, presence: { message: "ライブ名を入力してください。" } )
    validates( :artist, presence: { message: "アーティスト名を入力してください。" } )
    validates( :place_id, presence: { message: "都道府県を入力してください。" } )
    validates( :date, presence: { message: "日付を入力してください。" } )
    validates( :comment, presence: { message: "コメント(説明文)を入力してください。" } )
    validates( :hall, presence: { message: "会場を入力してください。" } )

    class << self
        def search(q, term, date, area)
            rel = order("created_at")
                #検索対象による分岐
                if( !term.present? )
                    rel = rel.where("name LIKE ? OR artist LIKE ?OR hall LIKE ?", "%#{q}%", "%#{q}%", "%#{q}%")
                else
                    rel = rel.where( term + " LIKE ?", "%#{q}%")
                end
                #他のオプション
                if( date.present? )
                    rel = rel.where("date LIKE ?", "%#{date}%")
                end
            rel
        end
    end
end
