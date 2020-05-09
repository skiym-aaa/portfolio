# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: ENV['admin_email'], password: ENV['admin_password'], password_confirmation: ENV['admin_password'])
User.create!(email: ENV['user_email'], password: ENV['user_password'], password_confirmation: ENV['user_password'], name: 'さっきー')
# アイドル
Idol.create!(user_id: '1', name: '9nine', about: 'パフォマンスガールズユニット', official_site: 'http://9nine-fan.lespros.co.jp/')
Idol.create!(user_id: '1', name: 'ベイビーレイズJAPAN', about: '2018年9月24日解散', official_site: 'http://babyraids.lespros.co.jp/')
Idol.create!(user_id: '1', name: '大阪☆春夏秋冬', about: '', official_site: 'https://syukasyun.com/')
Idol.create!(user_id: '1', name: 'EMPiRE', about: '', official_site: 'https://empire-official.com/')
Idol.create!(user_id: '1', name: 'GANGPARADE', about: '', official_site: 'https://www.gangparade.com/')
Idol.create!(user_id: '1', name: 'CARRY ROOSE', about: '', official_site: 'https://www.carryloose.com/')
Idol.create!(user_id: '1', name: 'BiS', about: '', official_site: 'https://www.brandnewidolsociety.tokyo/')
Idol.create!(user_id: '1', name: 'BiSH', about: '', official_site: 'https://www.bish.tokyo/')
# 場所
Place.create!(user_id: '1', name: 'ラゾーナ川崎プラザ', address: '神奈川県川崎市幸区堀川町72-1', about: 'ルーファ広場', official_site: 'https://mitsui-shopping-park.com/lazona-kawasaki/')
Place.create!(user_id: '1', name: 'サンシャインシティ', address: '東京都豊島区東池袋３丁目１', about: '噴水広場', official_site: 'https://sunshinecity.jp/')
Place.create!(user_id: '1', name: 'ラ チッタデッラ', address: '神奈川県川崎市川崎区小川町４−１', about: '', official_site: 'https://lacittadella.co.jp/')
Place.create!(user_id: '1', name: 'ららぽーと豊洲', address: '東京都江東区豊洲2-4-9', about: '', official_site: 'https://mitsui-shopping-park.com/lalaport/toyosu/')
Place.create!(user_id: '1', name: '新宿マルイ メン', address: '東京都新宿区新宿５丁目１６−４', about: '', official_site: 'https://www.0101.co.jp/074/')
Place.create!(user_id: '1', name: 'タワーレコード 横浜ビブレ', address: '神奈川県横浜市西区南幸２丁目１５−１３ GF 横浜ビブレ', about: 'niigo広場', official_site: 'https://tower.jp/store/kanto/YokohamaVIVRE')