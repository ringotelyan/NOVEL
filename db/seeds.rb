Admin.create!(
  email: 'admin@admin',
  password: 'adminadmin'
  )


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create!(
  [
    {email: 'yukio@test.com', name: 'ゆきお', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'osamu@test.com', name: 'おさむ', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'souseki@test.com', name: 'そうせき', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'ryuunosuke@test.com', name: 'りゅうのすけ', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'kenji@test.com', name: 'けんじ', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email: 'yasunari@test.com', name: 'やすなり', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {email: 'ougai@test.com', name: 'おうがい', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")},
    {email: 'chuuya@test.com', name: 'ちゅうや', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")},
    {email: 'shiki@test.com', name: 'しき', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")},
    {email: 'ichiyou@test.com', name: 'いちよう', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")}
  ]
)

genres = Genre.create!(
  [
    {name: 'ジャンル指定なし' },
    {name: '純文学' },
    {name: 'ミステリー' },
    {name: 'サスペンス' },
    {name: 'SF' },
    {name: 'ファンタジー' },
    {name: '青春' },
    {name: '冒険' },
    {name: '歴史' }
    ]
  )



Novel.create!(
  [
    {title: 'ずきこちゃん',
    body: '　近年、あるところに、赤ずきんに憧れる「ずきこちゃん」がいました。
　ずきこちゃんは、森の奥で暮らすおばあさんを訪ねるため、家を出ました。近年は大飢饉により食料が不足しているため、何もお土産は持っていません。なんなら、おばあさんのところで大量の食料にありつくがめつさも持ち合わせていました。
　ずきこちゃんは丸腰で家を出て、森に繰り出しました。
　それを見つめるオオカミ。オオカミは、ずきこちゃんの姿を捉えました。オオカミもまた、飢饉に苦しめられていたのです。近年のオオカミは人間は食べなかったのですが、オオカミは人間ですら食べたいと思うほど、飢えていたのです。
　オオカミは、ずきこちゃんがおばあさんの家を訪ねることを予測していました。先回りして、おばあさんを食らい、次いでずきこちゃんも食らうことを算段します。
　しかし、ずきこちゃんのおばあさんもまた、したたかでした。愚かで丸腰で浅はかなずきこちゃんがオオカミに目を付けられることは予測済みだったのです。そして、そのオオカミがおばあさんの家に来るであろうことも。
　だから、おばあさんは猟師さんをあらかじめ、自宅に待機させておきました。
「報酬はオオカミ肉だよ」
　飢饉とは無縁と思われている森の中でも、飢饉に苦しめられていたのです。猟師さんは、おばあさんの申し出を快く受けました。
　やはり、オオカミはおばあさんの家を訪ねました。猟師はすかさずオオカミの頭を撃ち抜きます。ずきこちゃんはたまたまこの現場に居合わせ、歓喜します。
「これでお腹いっぱいになれるわ！」
　おばあさんはにっこり笑い、猟師さんもにっこりと笑ってオオカミをさばきます。オオカミの肉の半分は猟師さんが持って帰り、残りの半分は三人で鍋にして食べました。
　しかし、オオカミはウイルスを持っていたのです。
　オオカミを食べた三人はウイルスに侵され、森の中でひっそりと眠りました。
', user_id: users[1].id, genre_id: genres[0].id },
    {title: 'カニ考える', body: '　カニが、何やら柿を眺めています。友達の蜂は声を掛けます。
「よお、カニ。何してるんだい」
「柿の可能性について考えてるんだ」
「柿の可能性？」
「応ともさ。この前、猿の奴にいじわるされたんだが、この猿が点で悪い奴で、私に柿を投げつけてきたんだ」
「えげつないことをするね」
「そうとも。それで、私のこの立派な甲羅に少しひびが入ってしまって、自信を失っていたところなんだよ」
「自信？」蜂は怪訝な顔をします。「自信ってなんだい」
「私の身体についてだよ。こんなにも弱かったのか、と」
「猿に復讐するんじゃないのかい」
「そんなの、後さ」カニは笑う。「まずは私の身体を完全な状態にして、弱点を見つけなければ。じゃないと、また猿にしてやられるよ。奴の脳みそが一番でかいんだから」
　蜂は溜息を吐きました。こうも行動に移さず考えてばかりいるから猿にしてやられるんだぞ、とは言いませんでした。そんなこと言ったら、カニから「私よりも脳みそが小さいくせに！」と言われるからです。カニさんは心優しいのですが、どこか頭でっかちなところがありました。
', user_id: users[0].id, genre_id: genres[0].id },
    {title: 'ドラゴンウサギ', body: '　ウサギは、おじいさんとおばあさんが大好きです。だから、おじいさんとおばあさんがタヌキにいたずらされたと知り、大層怒りました。
    「見ててください、おじいさん。私が必ずや、タヌキめを懲らしめてみせます。おばあさん、だからすぐに元気になってね」
    　ここから、ウサギの鍛錬が始まります。タヌキの背中を燃やすにしても、大量の木材、そして、着火剤が必要です。でも、この時代は着火剤がありませんので、まずは着火剤を作るところから始まります。
    「着火剤のつくり方なんかわからないよ」
    　ウサギは、大学に通うことを決めます。もちろん、学のないウサギですから、受験勉強などしたことがありません。すると、おばあさんが突然百万円を出してきました。
    「これで、予備校に通いなさい」
    「ありがとう、おばあさん！」
    　ウサギは意気揚々と、その百万円を予備校に持って行きました。さて、この一年間で、ウサギの偏差値はどのくらいあがるのでしょうか？', user_id: users[2].id, genre_id: genres[1].id },
    {title: '自立した桃', body: '　むかしむかしあるところに、おじいさんとおばあさんが住んでいました。
    　おじいさんは山へ芝刈りに、おばあさんは川へ洗濯に行きました。
    　おばあさんが川で洗濯をしていると、上流からどんぶらこどんぶらこと桃が流れて来るではありませんか。
    　おばあさんは桃を引き上げることには成功しましたが、持って帰ることができません。
    「……」
    　おばあさんは考えました。十中八九、この中には赤ちゃんが入っています。その赤ちゃんを見捨てることが、おばあさんにはどうしてもできません。おばあさんは試しに桃をノックします。
    「失礼しまーす……」
    「はーい」
    「運ぶの厳しいんで、自分で移動することってできます？」
    「余裕です！」
    　桃はひとりでに転がり始めました。', user_id: users[3].id, genre_id: genres[1].id },
    {title: 'ポエム', body: '小説投稿サイトに敢えてポエムを送るんだなぁ。', user_id: users[4].id, genre_id: genres[2].id },
    {title: 'ポエム2', body: '人間合格だもの。', user_id: users[5].id, genre_id: genres[3].id },
    {title: 'ポエム３', body: '十五歳で学を志して三十で独立するつもりでしたができなかったです。', user_id: users[6].id, genre_id: genres[4].id },
    {title: '鬼退治太郎', body: '　おじいさんが芝刈りから帰ってくると、桃がこちらに向かって転がって来るではありませんか。
    「大変だ！」
　　　叫んでいるのもつかの間、おばあさんが桃を追って走ってきます。おじいさんはそこで理解します。「ああ、赤ちゃんだな」、と。
　　　おじいさんとおばあさんは、いよいよ桃を割ります。
　　「あ、あんた、慎重にね！　中の赤ちゃんを傷つけちゃあ、駄目だよ」
　　「わかってるって」
　　「ぼく、左の方に寄っときますね！」
　　「頼むよ」
　　　中の赤ちゃんの手伝いもあり、おじいさんはスムーズに桃を割ることができました。赤ちゃんは片手をあげ「どうもどうも」と挨拶をします。
　　「ぼくは鬼退治太郎です」', user_id: users[7].id, genre_id: genres[0].id },
    {title: 'ポエム4', body: '赤ずきんちゃんのパロディと猿蟹合戦のパロディとカチカチ山のパロディと桃太郎のパロディです。', user_id: users[8].id, genre_id: genres[2].id },
    {title: '鬼退治犬', body: '「お腰に付けたきびだんご……」
    「やめときなって。消化に悪いから」
    　と、鬼退治太郎はさらにドッグフードを盛ります。イヌは喜んでがっつきます。
    「きみ、名前は？」
    「鬼退治犬です」
    「あ、きみかきみか。もう準備はできてる？」
    「サルとキジがまだです」
    「キジはもうちょっと後で、サルはちょっとカニと話し合いをしてるんだ」
    「大変ですね。裁判沙汰になったとか」
    「ね、カニみそは食べるだけの用途じゃなくサルを訴えることもできるんだ」
    「……ははっ」', user_id: users[9].id, genre_id: genres[3].id },
  ]
)