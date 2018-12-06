Event.create(name:"ライブ1", artist:"アーティストA", place_id:1, date:"Sat,1 Dec 2018", comment:"このライブは[日付]に開催される[アーティスト]のライブです。会場は[会場]です。", available:true, hall:"会場A")
Event.create(name:"ライブ2", artist:"アーティストA", place_id:1, date:"Sun,2 Dec 2018", comment:"このライブは[日付]に開催される[アーティスト]のライブです。会場は[会場]です。", available:true, hall:"会場B")
Event.create(name:"ライブ3", artist:"アーティストB", place_id:1, date:"Sat,1 Dec 2018", comment:"このライブは[日付]に開催される[アーティスト]のライブです。会場は[会場]です。", available:true, hall:"会場B")
Event.create(name:"ライブ4", artist:"アーティストB", place_id:1, date:"Sun,2 Dec 2018", comment:"このライブは[日付]に開催される[アーティスト]のライブです。会場は[会場]です。", available:true, hall:"会場A")
Event.create(name:"ライブ5", artist:"アーティストB", place_id:1, date:"Sun,2 Dec 2018", comment:"このライブは[日付]に開催される[アーティスト]のライブです。会場は[会場]です。", available:true, hall:"会場B")
prefs = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県","埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県","岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]
areas = ["北海道", "東北", "関東", "中部", "近畿", "中国", "四国", "九州"]
i = 0
0.upto(46) do |idx|
    Place.create( pref: prefs[idx], area: areas[i] )
    if idx == 0 || idx == 6 || idx == 13 || idx == 22 || idx == 29 || idx == 34 || idx == 38 then
        i+=1
    end
end