# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者
AdminUser.create!(email: ENV['admin_email'], password: ENV['admin_password'], password_confirmation: ENV['admin_password'])

# ユーザー
User.create!(email: ENV['user_email'], password: ENV['user_password'], password_confirmation: ENV['user_password'], name: 'さっきー')
User.create!(email: ENV['test_user_email'], password: ENV['test_user_password'], password_confirmation: ENV['test_user_password'], name: 'テストユーザー')

# アイドル
Idol.create!(user_id: '1', name: '9nine', about: 'パフォマンスガールズユニット', official_site: 'http://9nine-fan.lespros.co.jp/', official_twitter: 'https://twitter.com/lespros_9nine' ,official_youtube: 'https://www.youtube.com/user/9nineSMEJ', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B072MZQQ26/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B072MZQQ26&linkCode=as2&tag=skiymaaa0123-22&linkId=1a2e3566ebd0d8ba6d989732fb9c1336"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B072MZQQ26&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B072MZQQ26" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'ベイビーレイズJAPAN', about: '2018年9月24日解散', official_site: 'http://babyraids.lespros.co.jp/', official_twitter: 'https://twitter.com/babyraids_JAPAN' ,official_youtube: '', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B07H846J33/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B07H846J33&linkCode=as2&tag=skiymaaa0123-22&linkId=d31ffcf8aff6e9594a5cec22e3f35310"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B07H846J33&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B07H846J33" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: '大阪☆春夏秋冬', about: 'カタヤブリな浪花のロックンガール', official_site: 'https://syukasyun.com/', official_twitter: 'https://twitter.com/syukasyun' ,official_youtube: 'https://www.youtube.com/channel/UClyyTvF0BLPoZu5Xy_otSuw', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B0863NSY4Q/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B0863NSY4Q&linkCode=as2&tag=skiymaaa0123-22&linkId=fd5e4e1bf1b70d500bcc9b0ded5418a4"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B0863NSY4Q&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B0863NSY4Q" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'EMPiRE', about: 'WACKとavexによる共同プロジェクト', official_site: 'https://empire-official.com/', official_twitter: 'https://twitter.com/EMPiREIDOL' ,official_youtube: 'https://www.youtube.com/channel/UCigtU9n0IKuo-yaIXZRdEgw', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B07ZNLZYF5/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B07ZNLZYF5&linkCode=as2&tag=skiymaaa0123-22&linkId=9338d87dffbe9b92bb718126f44e8042"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B07ZNLZYF5&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B07ZNLZYF5" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'GANGPARADE', about: '分裂中', official_site: 'https://www.gangparade.com/', official_twitter: 'https://twitter.com/GANG_PARADE' ,official_youtube: '', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B07L9NB2M3/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B07L9NB2M3&linkCode=as2&tag=skiymaaa0123-22&linkId=7437de1325e926fd3c5da91ead99b172"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B07L9NB2M3&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B07L9NB2M3" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'CARRY ROOSE', about: '略称は「キャリルー」', official_site: 'https://www.carryloose.com/', official_twitter: 'https://twitter.com/CARRY_LOOSE' ,official_youtube: '', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B07XB4CV99/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B07XB4CV99&linkCode=as2&tag=skiymaaa0123-22&linkId=0a444d6127adfb2cd20a12f3226bf62f"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B07XB4CV99&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B07XB4CV99" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'BiS', about: '第3期。新生アイドル研究会', official_site: 'https://www.brandnewidolsociety.tokyo/', official_twitter: 'https://twitter.com/BiSidol' ,official_youtube: '', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B081WQY65G/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B081WQY65G&linkCode=as2&tag=skiymaaa0123-22&linkId=df0426e656067490d9ffa3db35689ebf"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B081WQY65G&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B081WQY65G" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'BiSH', about: '楽器を持たないパンクバンド', official_site: 'https://www.bish.tokyo/', official_twitter: 'https://twitter.com/BiSHidol' ,official_youtube: '', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B07NXF5VJ1/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B07NXF5VJ1&linkCode=as2&tag=skiymaaa0123-22&linkId=c1fd445fac6632996a51e9fd01c8af80"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B07NXF5VJ1&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B07NXF5VJ1" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: '東京パフォーマンスドール', about: '通称「TPD」', official_site: 'https://tpd-web.com/', official_twitter: 'https://twitter.com/TPD_official' ,official_youtube: 'https://www.youtube.com/user/tpdSMEJ', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B07HQ373X5/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B07HQ373X5&linkCode=as2&tag=skiymaaa0123-22&linkId=aa0efbbcc6d68034c359460924664a55"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B07HQ373X5&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B07HQ373X5" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: '真っ白なキャンパス', about: '「重なり合ったそれぞれの色は、真っ白な光になる。そんなキャンバスに夢を描いてゆく」', official_site: 'http://shirokyan.com/', official_twitter: 'https://twitter.com/info_shirokyan' ,official_youtube: 'https://www.youtube.com/channel/UCRnqQVrTuiP1nfe-JamOemQ', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B081LZFGTJ/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B081LZFGTJ&linkCode=as2&tag=skiymaaa0123-22&linkId=2da014b2d0f96736b6be97735571bcd8"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B081LZFGTJ&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B081LZFGTJ" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'あゆみくりかまき', about: '歌うたいの「あゆみ」と、DJ の「くりか」、盛り上げ役の「まき」からなる「あゆみくりかまき」', official_site: 'https://ayumikurikamaki.com/', official_twitter: 'https://twitter.com/ayukumaofficial' ,official_youtube: 'https://www.youtube.com/channel/UCIaaOIGVjsoHk_JiVpDy7mw', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B087C4S8BN/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B087C4S8BN&linkCode=as2&tag=skiymaaa0123-22&linkId=40ebf4272133ae51b878bcc4d814d11c"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B087C4S8BN&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B087C4S8BN" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: '26時のマスカレイド', about: '通称「ニジマス」', official_site: 'https://26masquerade.com/', official_twitter: 'https://twitter.com/nijimasu_staff' ,official_youtube: 'https://www.youtube.com/channel/UCzgEXy7eTK9EyhUbU0DZ_Lg', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B07VVD8N8H/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B07VVD8N8H&linkCode=as2&tag=skiymaaa0123-22&linkId=82655b3953685238669c7bd3ffa3766a"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B07VVD8N8H&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B07VVD8N8H" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'SUPER☆GiRLS', about: '結成10周年ライブを6月11日に日本青年館ホールで実施予定', official_site: 'https://supergirls.jp/', official_twitter: 'https://twitter.com/SUPERGiRLS_AMG' ,official_youtube: 'https://www.youtube.com/channel/UCj8w3VPkOJyUXlDJJnWjhdg', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B07Z5RTVBW/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B07Z5RTVBW&linkCode=as2&tag=skiymaaa0123-22&linkId=92d64f73de4ec717e12f98d804ee73fb"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B07Z5RTVBW&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B07Z5RTVBW" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'ラストアイドル', about: '秋元康プロデュースのアイドルグループ', official_site: 'https://www.universal-music.co.jp/last-idol/', official_twitter: 'https://twitter.com/last_idol_pr' ,official_youtube: 'https://www.youtube.com/channel/UCIl3TIM7dAJYOKsEmTTrvtg', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B086VY4KGC/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B086VY4KGC&linkCode=as2&tag=skiymaaa0123-22&linkId=aa202ca09489a20a7f7816df392d78dc"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B086VY4KGC&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B086VY4KGC" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'Pimms', about: 'TOKYO GIRLS MIXTURE', official_site: 'https://pimmsofficial.futureartist.net/', official_twitter: 'https://twitter.com/Pimms_official' ,official_youtube: 'https://www.youtube.com/user/PimmsOfficial', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B07TLPBC5Z/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B07TLPBC5Z&linkCode=as2&tag=skiymaaa0123-22&linkId=a05789e404eae10883adcf038e3bd9c4"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B07TLPBC5Z&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B07TLPBC5Z" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'わーすた', about: '「The World Standard」。2015年に結成のデジタルネイティブ世代アイドル。', official_site: 'https://wa-suta.world/profile/', official_twitter: 'https://twitter.com/tws_staff' ,official_youtube: 'https://www.youtube.com/channel/UCpz1sUYoIaAwRU5iPJtlHeg', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B0832KZPYV/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B0832KZPYV&linkCode=as2&tag=skiymaaa0123-22&linkId=82c9847f1acbf0b737af1f7f48c9a04f"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B0832KZPYV&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B0832KZPYV" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: '東京女子流', about: '2010年結成の山邊未夢・新井ひとみ・中江友梨・庄司芽生からなるガールズ・ダンス&ボーカル・グループ', official_site: 'https://tokyogirlsstyle.jp/', official_twitter: 'https://twitter.com/TokyoGirlsStyle' ,official_youtube: 'https://www.youtube.com/channel/UCkafLPXB6MgLmTbq8UHE8Cg', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B084DLJZNM/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B084DLJZNM&linkCode=as2&tag=skiymaaa0123-22&linkId=e1434e65d968fa147352307c7e806903"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B084DLJZNM&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B084DLJZNM" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'sora tob sakana', about: '唯一無二の世界観', official_site: 'https://soratobsakana.tokyo/', official_twitter: 'https://twitter.com/soratobsakana' ,official_youtube: 'https://www.youtube.com/channel/UCk2mfF3LamJRjhwGcepMdqQ', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B07W7GPJSS/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B07W7GPJSS&linkCode=as2&tag=skiymaaa0123-22&linkId=4285db80ef66b5d6481da9133ec14d8b"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B07W7GPJSS&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B07W7GPJSS" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'フィロソフィーのダンス', about: '略称はフィロのス', official_site: 'https://danceforphilosophy.com/', official_twitter: 'https://twitter.com/dfp_2015' ,official_youtube: 'https://www.youtube.com/channel/UC29nPPYXVGIhE3ZDMzLSbPQ/feed', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B083QRHRHL/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B083QRHRHL&linkCode=as2&tag=skiymaaa0123-22&linkId=85dc173dd992fc126a6799d914555174"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B083QRHRHL&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B083QRHRHL" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: 'マジカルパンチライン', about: '通称「マジパン」', official_site: 'http://magipun.com/', official_twitter: 'https://twitter.com/MAGiPUNofficial' ,official_youtube: 'https://www.youtube.com/channel/UC2W4F0roFIu5jN9ACjB6VWA', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B081F67VZC/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B081F67VZC&linkCode=as2&tag=skiymaaa0123-22&linkId=d4219a34e9cccd336fe3a9c102ba0e47"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B081F67VZC&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B081F67VZC" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
Idol.create!(user_id: '1', name: '＝LOVE', about: 'さっしー(指原莉乃)プロデュース。通称イコラブ', official_site: 'https://equal-love.jp/', official_twitter: 'https://twitter.com/equal_love_12' ,official_youtube: 'https://www.youtube.com/channel/UCv7VutirxDn3RWIJXI68n_A', default_image: '<a target="_blank"  href="https://www.amazon.co.jp/gp/product/B083VD311Q/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B083VD311Q&linkCode=as2&tag=skiymaaa0123-22&linkId=8c5de5a6ee1877a272b4de43d326409f"><img border="0" src="//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B083VD311Q&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=skiymaaa0123-22" ></a><img src="//ir-jp.amazon-adsystem.com/e/ir?t=skiymaaa0123-22&l=am2&o=9&a=B083VD311Q" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />')
# Idol.create!(user_id: '1', name: '', about: '', official_site: '', official_twitter: '' ,official_youtube: '', default_image: '')

# 場所
Place.create!(user_id: '1', name: 'ラゾーナ川崎プラザ', address: '神奈川県川崎市幸区堀川町72-1', about: 'ルーファ広場', official_site: 'https://mitsui-shopping-park.com/lazona-kawasaki/')
Place.create!(user_id: '1', name: 'サンシャインシティ', address: '東京都豊島区東池袋３丁目１', about: '噴水広場', official_site: 'https://sunshinecity.jp/')
Place.create!(user_id: '1', name: 'ラ チッタデッラ', address: '神奈川県川崎市川崎区小川町４−１', about: '', official_site: 'https://lacittadella.co.jp/')
Place.create!(user_id: '1', name: 'ららぽーと豊洲', address: '東京都江東区豊洲2-4-9', about: '', official_site: 'https://mitsui-shopping-park.com/lalaport/toyosu/')
Place.create!(user_id: '1', name: '新宿マルイ メン', address: '東京都新宿区新宿５丁目１６−４', about: '', official_site: 'https://www.0101.co.jp/074/')
Place.create!(user_id: '1', name: 'タワーレコード 横浜ビブレ', address: '神奈川県横浜市西区南幸２丁目１５−１３ GF 横浜ビブレ', about: 'niigo広場', official_site: 'https://tower.jp/store/kanto/YokohamaVIVRE')
Place.create!(user_id: '1', name: 'ららぽーと横浜', address: '神奈川県横浜市都筑区池辺町４０３５−１', about: '', official_site: 'https://mitsui-shopping-park.com/lalaport/yokohama/')
Place.create!(user_id: '1', name: 'ららぽーと立川立飛', address: '東京都立川市泉町935番地の1', about: '', official_site: 'https://mitsui-shopping-park.com/lalaport/tachikawa/')
Place.create!(user_id: '1', name: 'CLUB CITTA (クラブチッタ)', address: '神奈川県川崎市川崎区小川町５−７', about: '', official_site: 'https://clubcitta.co.jp/')
Place.create!(user_id: '1', name: 'お台場 フジテレビ マイナビステージ', address: '東京都港区台場二丁目4番8号', about: '', official_site: '')
Place.create!(user_id: '1', name: 'マイナビBLITZ赤坂', address: '東京都港区赤坂５丁目３−２', about: '', official_site: 'https://www.tbs.co.jp/blitz/')
Place.create!(user_id: '1', name: 'DMM VR THEATER YOKOHAMA', address: '神奈川県横浜市西区南幸２丁目１−５', about: '', official_site: 'https://vrt.dmm-futureworks.com/')
Place.create!(user_id: '1', name: '新宿BLAZE', address: '東京都新宿区歌舞伎町１丁目２１−７', about: '', official_site: 'http://shinjuku-blaze.com/')
Place.create!(user_id: '1', name: 'duo MUSIC EXCHANGE', address: '東京都渋谷区道玄坂２丁目１４−８ O-EASTビル', about: '', official_site: 'http://www.duomusicexchange.com/')
Place.create!(user_id: '1', name: 'CBGKシブゲキ！！', address: '東京都渋谷区道玄坂２丁目２９−５', about: '', official_site: 'http://cbgk.jp/')
Place.create!(user_id: '1', name: '中野サンプラザ', address: '東京都中野区中野４丁目１−１', about: '', official_site: 'https://www.sunplaza.jp/')
Place.create!(user_id: '1', name: 'SHIBUYA PLEASURE PLEASURE', address: '東京都渋谷区道玄坂２丁目２９−５ 渋谷プライム 6F', about: '', official_site: 'http://www.pleasure-pleasure.jp/')
Place.create!(user_id: '1', name: '上野音横丁', address: '東京都台東区東上野３丁目１６−３', about: '', official_site: '')
Place.create!(user_id: '1', name: '日本青年館', address: '東京都新宿区霞ヶ丘町4-1', about: '', official_site: 'https://seinenkan-hall.com/')
Place.create!(user_id: '1', name: 'Zepp Tokyo', address: '東京都江東区青海１丁目３−１１', about: '', official_site: 'https://www.zepp.co.jp/hall/tokyo/')
Place.create!(user_id: '1', name: 'TSUTAYA O-Crest', address: '東京都渋谷区道玄坂２丁目１４−８ 5F', about: '', official_site: 'https://shibuya-o.com/venues/tsutaya-o-crest/')
Place.create!(user_id: '1', name: 'TOKYO DOME CITY HALL', address: '東京都文京区後楽1-3-61　東京ドームミーツポート1F', about: '', official_site: 'https://www.tokyo-dome.co.jp/tdc-hall/')
Place.create!(user_id: '1', name: 'TSUTAYA O-WEST', address: '東京都渋谷区円山町２−３ 2F', about: '', official_site: 'https://shibuya-o.com/venues/tsutaya-o-west/')
Place.create!(user_id: '1', name: 'その他', address: 'なし', about: '', official_site: '')
# Place.create!(user_id: '1', name: '', address: '', about: '', official_site: '')

# イベント
# Event.create!(user_id: '1', idol_id: '', place_id: '', title: '', body: '開催予定', open_date: '2020-00-00 00:00:00', start_date: '2020-00-00 00:00:00', end_date: '2020-00-00 00:00:00')
