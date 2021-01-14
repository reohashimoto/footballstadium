# README
footoballstadiumのDB設計

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
|home_team_scorer     |integer |                          |
|away_team_scorer     |integer |                          |
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