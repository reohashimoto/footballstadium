# README
# アプリケーション名
Football Stadium
# アプリケーション概要
 ・最新試合の閲覧
 ・試合の投稿
 ・コメント機能
 ・試合の検索機能
# URL
https://footballstadium.herokuapp.com/

# テスト用アカウント
メールアドレス: doribler@example

パスワード　　: leo1997

# 利用方法
日本から世界までの様々なサッカーの試合を確認できます。
試合結果の確認はログインをしなくてもトップページで確認できます。
検索機能は試合を検索でき、検索すると表示されます。
トップページの試合をクリックすると試合の詳細が見られます。（ゴールスコアラー、レビューなど）
ニュース一覧のニュースをクリックすると記事の移動します。
登録をするとコメント機能と試合登録機能が追加されます。

# 課題解決
私は海外でサッカーをしていました。その時にサッカーの結果を見ることができるサイトがあり、そのサイトでは一部二部のリーグのみだけでなく私が所属している下部リーグの結果まで見ることができました。日本にはJリーグより下のリーグの試合結果を確認できるものがなく、私自信が必要だと感じたためこのようなサイトを作りました。サポーターやファンの方からすればアウェーの試合などは遠い場合だと見にいけない場合があるのですぐに結果を確認することができませんが、このサイトを利用することでいち早く結果の確認ができます。

# 参考画像
[![Image from Gyazo](https://i.gyazo.com/efd0441f6a832dfe755ad1e747ea5d22.png)](https://gyazo.com/efd0441f6a832dfe755ad1e747ea5d22)

[![Image from Gyazo](https://i.gyazo.com/0073fed66a4ec9acf23341058ffe9841.png)](https://gyazo.com/0073fed66a4ec9acf23341058ffe9841)

# 洗い出した要件
・ユーザー登録機能（device）
・試合結果投稿機能
・コメント投稿機能
・ページネーション機能（kaminari）
・画像スライド（slick）
・試合検索機能
・リーグ自体の登録
・選手の登録

# 実装した機能
・ユーザー登録機能（device）

・試合結果投稿機能

・コメント投稿機能
[![Image from Gyazo](https://i.gyazo.com/8a2aaac7c4c3206435d662a08d2c6066.png)](https://gyazo.com/8a2aaac7c4c3206435d662a08d2c6066)

・画像スライド（slick）

[![Image from Gyazo](https://i.gyazo.com/1133c690cc298795eb39033acff87dfa.gif)](https://gyazo.com/1133c690cc298795eb39033acff87dfa)

・試合検索機能（リーグや場所での検索も出来ます。）
[![Image from Gyazo](https://i.gyazo.com/8355838d07ab13c301aec2fd2746739f.gif)](https://gyazo.com/8355838d07ab13c301aec2fd2746739f)

・ページネーション機能（kaminari）

[![Image from Gyazo](https://i.gyazo.com/dcc18fc33b981ca6bae6f018de848ef1.gif)](https://gyazo.com/dcc18fc33b981ca6bae6f018de848ef1)


# 実装予定の機能
・リーグ自体の登録
・選手の登録
・試合予定の一覧


# footoballstadiumのDB設計

## usersテーブル

| Column              | Type   | Options                  |
|-------------------- |------- |------------------------- |
|email                |string  |null: false, unique: true |
|encrypted_password   |string  |null: false               |
|nickname             |string  |null: false               |
|favorite_team        |string  |null: false               |
|favorite_player      |string  |null:false                |
|birthday             |date    |null: false               |


### Association

- has_many :matches
- has_many :comments

## matchテーブル

| Column              | Type   | Options                  |
|-------------------- |------- |------------------------- |
|home_team_name       |string  |null: false               |
|away_team _name      |string  |null: false               |
|home_team_image      |string  |null: false               |
|away_team_image      |string  |null: false               |
|home_team_score      |integer |null: false               |
|away_team_score      |integer |null: false               |
|home_team_scoreler   |integer |                          |
|away_team_scoreler   |integer |                          |
|league               |integer |null: false               |
|place                |integer |null: false               |
|review               |integer |                          |
|date                 |date    |null: false               |

### Association

- belongs_to :user
- has_many   :comments

## commentsテーブル

| Column              | Type      | Options                         |
|-------------------- |---------- |-------------------------------- |
|text                 |text       |null: false                      |
|user                 |references |null: false, foreign_key: true   |
|item                 |references |null: false, foreign_key: true   |


### Association

- belongs_to :user
- belongs_to :match