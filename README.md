## アプリケーション概要

### アプリケーション名
熱闘草野球

### アプリケーションの概要（コンセプト）
草野球チームで助っ人を募集している方と助っ人に参加したい方を繋ぐアプリケーションです。
一つのアプリケーションで投稿ができユーザー同士でメッセージを送り会えるものです。

### 制作背景
私自身が普段使用している草野球の助っ人募集の掲示板は、投稿に記載されているメールアドレスにメールを送って連絡を取り合うもので使いにくさと手間を感じました。1つにアプリケーション内で投稿もできてメッセージのやりとりができるものを作りたいと思ったのがきっかけです。

## アプリケーションの利用方法

### URL(デプロイ)
<https://b-helper.herokuapp.com/>

### テスト用アカウント
```md
認証ID:admin
パスワード:2222
メールアドレス:test@email.com
パスワード:aaaaaa
```

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