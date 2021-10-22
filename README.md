## アプリケーション名
熱闘草野球

## アプリケーションの概要
草野球チームで助っ人を募集している方と助っ人に参加したい方を繋ぐアプリケーションです。

多くの草野球チームがチーム事情によりメンバーを揃えることができず、毎日のように掲示板に助っ人募集の投稿がされています。
既存の掲示板では投稿に記載されているメールアドレスにメールを送り、そこからLINEや電話番号を交換して連絡をとっていました。
多くのユーザーが感じる、「メールで連絡をとりあう不便さ」と「見ず知らずの人と連絡先を交換しなければいけないこと」を解決したアプリケーションです。


## トップページ
https://user-images.githubusercontent.com/83623919/131804757-7d052d13-7a3f-4419-ac7f-d7f1e195e3a1.mp4

投稿がない時は投稿のサンプルを表示しています。

## 投稿機能
https://user-images.githubusercontent.com/83623919/131839688-1f8a517d-05ed-4eb9-94fd-6a1353d8a84f.mp4

日付はカレンダーで、時間はプルダウンで選択出来ます。

## 投稿編集機能
https://user-images.githubusercontent.com/83623919/131842470-33cf8775-1506-4de4-905a-0a7298998c73.mp4

## 投稿削除機能
https://user-images.githubusercontent.com/83623919/131842628-c800c5a8-fd5d-415b-8c1e-b653ace00326.mp4

## 投稿者のみが編集と削除ができる
https://user-images.githubusercontent.com/83623919/131842957-db66bbd6-4d27-4313-ade3-8d214d72b458.mp4

## メッセージ機能(1)
https://user-images.githubusercontent.com/83623919/131845124-f5a06a5d-e76c-4b16-8b0f-f2d456f5a826.mp4

## メッセージ機能(2)
https://user-images.githubusercontent.com/83623919/131846907-962ba06c-61c3-4f67-8419-6ad674902896.mp4

## メッセージ機能(3)
https://user-images.githubusercontent.com/83623919/131847262-7173a8ea-952a-42ce-9875-a9251f295860.mp4

ユーザー同士でメッセージが送りあえます

## チャットルーム削除機能
https://user-images.githubusercontent.com/83623919/131847583-07eef272-e476-4c60-811c-457111b6b70c.mp4

チャットルームを削除するとメッセージも同時に削除され、
相手側もチャットルームは削除されます。


## コメント機能
https://user-images.githubusercontent.com/83623919/133925850-0617780e-15a5-498a-9eac-2be502473d10.mp4

投稿の詳細画面からコメントすることが出来ます。

## インフラ図
<img width="1187" alt="086b38320aaedb0cc9fe24c134b1287e" src="https://user-images.githubusercontent.com/83623919/136892808-d2d388b1-adc5-4366-a656-168c03771f8f.png">

## URL(デプロイ)
<http://b-helper.work/>

## テスト用アカウント
```md
認証ID:admin
パスワード:2222
メールアドレス:test@email.com
パスワード:aaaaaa
```

## 作成動機
私自身が普段使用している草野球の助っ人募集の掲示板は、投稿に記載されているメールアドレスにメールを送って連絡を取り合うもので使いにくさと手間を感じました。メールで連絡を取り合い、メールの使いずらさからメッセージアプリを交換したりと二度手間になっています。また見ず知らずの人と1回の試合に参加するためだけに連絡先や電話番号などの個人情報を交換することに抵抗を感じていました。
メールやメッセージアプリを経由することなく、SNSのように投稿にコメントができたり、投稿者にメッセージを送れたり、1つにアプリケーション内で`投稿`もできて`メッセージ`のやりとりができるものを作りたいと思ったのがきっかけです。

### 投稿について
助っ人に参加したい側が特に知りたいのは「日付」と「時間」、
投稿者にもカレンダーとプルダウンを使用することで手間を無くしました。

### メッセージについて
掲示板だとメールやLINEなどでメッセージのやりとりをするので、見ず知らずの人と連絡先を交換するのに抵抗を感じていました。
ひとつのアプリケーション内でメッセージのやり取りが出来る様に出来るようにしました。

## 今後実装したい機能

### メッセージ機能の非同期化
世の中で使われている多くのサービスでは非同期化されているため、ユーザーにとっては当たり前の機能だと思われていると思います。
現状ではリロードをしないと、新しいメッセージを受信できないので、ユーザーにとっては扱いにくさを感じると思います。

### メッセージの通知機能
現状ではメッセージルームの中に入らないと新規のメッセージが来てるかどうか分からないので、ヘッダーの中などに通知ボタンなどを配置してどこのページにいても新規メッセージが来たことが、分かるようにしていきたいです。

### レスポンシブ化
レスポンシブ対応になっていないところがあるのでBootstrapやJavaScriptなどを使用して様々な機種でも対応できるデザインにしていきたいです。

# テーブル設計

## users テーブル

| Column                 | Type          | Options                          |
|------------------------|---------------|----------------------------------|
| nickname               | string        | null: false                      |
| email                  | string        | null: false, unique: true        |
| encrypted_password     | string        | null: false                      |

### Association
-has_many :room_users
-has_many :room, through: room_users
-has_many :messages
-has_many :posts

## rooms テーブル

| Column                | Type           | Options                          |
|-----------------------|----------------|----------------------------------|
| name                  | string         | null: false                      |


### Association
-has_many :room_users
-has_many :users. through: room_users
-has_many :messages

## room_users テーブル

| Column                | Type            | Options                         |
|-----------------------|-----------------|---------------------------------|
| user                  | references      | null: false, foreign_key: true  |
| room                  | references      | null: false, foreign_key: true  |

### Association
-belongs_to :room
-belongs_to :user

## messages テーブル

| Column                | Type            | Options                         |
|-----------------------|-----------------|---------------------------------|
| content               | string          |                                 |
| user                  | references      | null: false, foreign_key: true  |
| room                  | references      | null: false, foreign_key: true  |

### Association
-belongs_to :room
-belongs_to :user

## posts テーブル
| Column                | Type            | Options                         |
|-----------------------|-----------------|---------------------------------|
| date                  | date            | null: false                     |
| time_id               | integer         | null: false                     |
| detail                | text            | null: false                     |
| user                  | references      | null: false, foreign_key: true  |

### Association
-belongs_to :user

## comments テーブル
| Column                | Type            | Options                         |
|-----------------------|-----------------|---------------------------------|
| text                  | text            |                                 |
| user                  | integer         |                                 |
| post                  | integer         |                                 |

### Association
-belongs_to :user
-belongs_to :post