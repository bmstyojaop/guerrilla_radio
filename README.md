# Guerrilla Radio
　READ.MEをご覧いただきありがとうございます。  
　本アプリのテーマは音楽機材投稿アプリです。音楽好き同士で機材を見せあったり、投稿された機材をお気に入りとしてコレクションしたりできるアプリケーションを目指しました。  是非実際に触って確かめてください。  
　日々改良しながら、技術を上げていきたいと思いますので、アドバイス等いただけましたら幸いです。

# 目次
* 本番環境URL
* 動作確認方法
* DB設計
* 本アプリケーションの紹介


# 本番環境URL
https://guerrillaradio.herokuapp.com/

# 動作確認方法  
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
  
  
# アプリケーションの説明
## トップ画面
こちらはトップ画面です。いいねボタンはログインしないと押せない仕様になっております。
左上のロゴはトップ画面へのリンクとなっております。
![5D6C9CE8-1155-4060-80A3-6DBD59AF93DB_1_105_c](https://user-images.githubusercontent.com/67671210/96331310-4ba2d200-1097-11eb-9fe9-68d063940ce5.jpeg)

## 検索機能
ヘッダー中央に位置する検索窓から投稿の検索を行うことができます。
![search](https://user-images.githubusercontent.com/67671210/96339908-72322e80-10d2-11eb-8028-0d77e2287944.gif)


## 投稿機能
新規投稿時の画面です。
ヘッダー内のプラスボタンをクリックすると、新規投稿画面へと遷移します。
![66CBC6EE-4AEB-40D9-BCEE-BA5DBF43B300_1_105_c](https://user-images.githubusercontent.com/67671210/96332497-3df14a80-109f-11eb-8922-56091795b81c.jpeg)


## お気に入り機能
いいねボタンです。クリックすると「お気に入り」がつき、もう一度クリックすると「お気に入り」が外れます。
![like](https://user-images.githubusercontent.com/67671210/96339904-6e061100-10d2-11eb-98f6-ca1c61a2eb6b.gif)



## いいね一覧
ヘッダーの☆マークをクリックすると、お気に入り一覧ページへ遷移します。
![likecollection](https://user-images.githubusercontent.com/67671210/96339905-6fcfd480-10d2-11eb-8ad6-660763e97036.gif)


## コメント機能
投稿されたデータのハンバーガーメニューから詳細ボタンをクリックしていただくと、投稿詳細ページへ遷移します。  
そちらのページで、コメントを入力していくことができます。
![comment](https://user-images.githubusercontent.com/67671210/96339899-67779980-10d2-11eb-9e59-ddd0bbba448d.gif)




