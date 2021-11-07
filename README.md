# アプリケーション名
 GoodJobApp

# 概要
 建設業における、作業員と責任者監督等を繋ぐ、現場を可視化するためのアプリケーションです。
 主な機能はグループチャットアプリですが、現場の位置情報なども登録することができます。

# URL
 https://good-job-app-33053.herokuapp.com/

 basic認証用
 <br>
  ・ユーザー名 :koutaro
  <br>
  ・パスワード :1234
  <br>

 ユーザーログイン用
 <br>
  ・メールアドレス :tanaka@com
  <br>
  ・パスワード :123tanaka
  <br>

# 制作背景
 私は前職で建設業の現場作業員をしていましたが、現場の住所の詳細が書かれていないということが多くあり、また急な作業内容の変更などイレギュラーがあったとき直接、監督さんや現場監督に連絡を取りたい時、社長経由で連絡を取らなくてはいけないが、社長が他現場に出向いていたりと時間を不用意に使ってしまうことが多々ありましたので、現場の詳細をすぐに確認でき、画像の送信もできるチャット機能のあるアプリを制作いたしました。

# 工夫したポイント
 Maps Javascript APIを導入してマップの埋め込みを行いました。
 また住所から緯度経度を算出する、Geocoder APIを導入してマーカーを表示できるように実装致しました。
 AWSを使いS3を導入しました。

# 使用技術
 RubyOnRails6.0.0
 <br>
 JavaScript
 <br>
 MySQL
 <br>
 AWS

# 今後実装したい機能
・カレンダーを実装して工期や予定表を作成できる機能の実装
<br>
・リーダー権限を設けてチャットグループの作成、削除を制限する機能
<br>
・他人数でのグループチャットの実装
<br>
・既読機能の実装



# テーブル設計

## users

| Column | Type | Options |
| ------ | ---- | ------- |
| family_name | string | null: false |
| last_name | string | null: false |
| phone_number | string | null: false |
| email | string | null: false |
| encrypted_password | string | null: false |
| company_name | string | null: false

### Association

- has_many :map_users
- has_many :maps, through: map_users
- has_many :messages

## maps

| Column | Type | Options |
| ------ | ---- | ------- |
| title | string | null: false |
| address | text | null: false |
| latitude | float | null: false |
| longitude | float | null: false |
| content | text |        |

### Association

- has_many :map_users
- has_many :users, through: map_users
- has_many :messages

## map_users

| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | null: false, foreign_key: true |
| map | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :map

## messages

| Column | Type | Options |
| ------ | ---- | ------- |
| comment | text |  |
| user | references | null: false, foreign_key: true |
| map | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :map