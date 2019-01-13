class Event < ActiveRecord::Base
    validates( :name, presence: true )
    validates( :artist, presence: true )
    validates( :place_id, presence: true )
    validates( :date, presence: true )
    validates( :comment, presence: true )
    validates( :hall, presence: true )

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
