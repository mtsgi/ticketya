class Event < ActiveRecord::Base
    class << self
        def search(q, term)
            rel = order("created_at")
            if( q.present? )
                if( term.present? )
                    rel = rel.where( term+" LIKE ?", "%#{q}%")
                else
                    rel = rel.where("name LIKE ? OR artist LIKE ?OR comment LIKE ?", "%#{q}%", "%#{q}%", "%#{q}%")
                end
            end
            rel
        end
    end
end
