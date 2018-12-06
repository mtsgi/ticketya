class Event < ActiveRecord::Base
    class << self
        def search(q)
            rel = order("created_at")
            if( q.present? )
                rel = rel.where("name LIKE ? OR artist LIKE ?", "%#{q}%", "%#{q}%")
            end
            rel
        end
    end
end
