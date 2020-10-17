# Guerrilla Radio
READ.MEをご覧いただきありがとうございます。
本アプリのテーマは音楽機材投稿アプリです。

本番環境URL: https://guerrillaradio.herokuapp.com/

動作確認方法  
URL(https://guerrillaradio.herokuapp.com/) へアクセスしていただき、  
「ゲストログイン（閲覧用）」をしてご確認ください。

# DB設計
## users(ユーザーデータ)
| Column | Type | Options|
|--------|------|--------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false, unique: true, index: true|
  
### Association

- devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
- has_many :tweets, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :like_tweets, through: :likes, source: :tweet

## tweetsテーブル(投稿データ)
| Column | Type | Options|
|--------|------|--------|
|text|string||
|image|text|null: false|
|user_id|integer||
  
### Association

- belongs_to :user
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user


## likesテーブル
| Column | Type | Options|
|--------|------|--------|
|user_id|integer||
|tweet_id|integer||
  
### Association
- belongs_to :tweet, counter_cache: :likes_count
- belongs_to :user

## commentsテーブル
| Column | Type | Options|
|--------|------|--------|
|text|text||
|user_id|integer||
|tweet_id|integer||
  
### Association
- belongs_to :user
- belongs_to :tweet
