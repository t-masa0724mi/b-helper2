## アプリケーション概要

## アプリケーション名
熱闘草野球

## アプリケーションの概要（コンセプト）
草野球チームで助っ人を募集している方と助っ人に参加したい方を繋ぐアプリケーションです。
掲示板などのようにメールアドレスやLINEを交換したりする抵抗や手間をなくしました。

## トップページ
<img width="1660" alt="69654549ffa320933603db0a40610191 (1)" src="https://user-images.githubusercontent.com/83623919/131807181-a85bcfb3-61b2-4f9b-9f95-4c5861077190.png">

## トップページ
https://user-images.githubusercontent.com/83623919/131804757-7d052d13-7a3f-4419-ac7f-d7f1e195e3a1.mp4

投稿がない時は投稿のサンプルを表示しています。

## 投稿機能
https://user-images.githubusercontent.com/83623919/131839688-1f8a517d-05ed-4eb9-94fd-6a1353d8a84f.mp4

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

## URL(デプロイ)
<https://b-helper.herokuapp.com/>

## テスト用アカウント
```md
認証ID:admin
パスワード:2222
メールアドレス:test@email.com
パスワード:aaaaaa
```

## 作成動機
私自身が普段使用している草野球の助っ人募集の掲示板は、投稿に記載されているメールアドレスにメールを送って連絡を取り合うもので使いにくさと手間を感じました。1つにアプリケーション内で`投稿`もできて`メッセージ`のやりとりができるものを作りたいと思ったのがきっかけです。

[投稿について]
助っ人に参加したい側が特に知りたいのは「日付」と「時間」、
投稿者にもカレンダーとプルダウンを使用することで手間を無くしました。

[メッセージについて]
### 課題
掲示板だとメールやLINEなどでメッセージのやりとりをするので、見ず知らずの人と連絡先を交換するのに
抵抗を感じていました。

### 結論
ひとつのアプリケーション内でメッセージのやり取りが出来る様に出来るようにしました。


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