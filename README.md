# Pit In
http://18.179.225.15/  
ゲストログイン機能を実装しております。ご活用ください。

## 概要
目標と日々の行動をセットで管理し、また目標達成のサポートをするアプリケーションです。  
目標と行動をセットで管理することで日々の「何をしなにといけないんだっけ？」を防ぎます。  
目標公開&追加機能、コミュニティ機能により目標達成をさらにサポートします。


## 使用技術
- Ruby 2.6.5
- Rails 5.2.4
- Bootstrap4
- PostgreSQL
- Nginx
- Puma
- AWS
- Capistrano3
- RSpec


## 機能一覧
#### ユーザー関連
- ユーザー登録、ログイン機能（device）

#### 目標作成関連
- 目標を作成
  - 目標一覧
  - 目標作成(nested_form)
  - 目標編集(nested_form)
  - 目標削除

#### プランニング関連
- 各項目のステータス変更

#### 目標公開&追加関連
- 目標公開
- 目標検索(ransack)
- 目標追加(deep_cloneable)

#### コミュニティ関連
- コミュニティ作成
- コミュニティ検索(ransack)
- コメント投稿(Ajax)

#### ユーザーフォロー関連
- ユーザーフォロー(Ajax)


## カタログ設計
https://docs.google.com/spreadsheets/d/13sQJtfMkbIGoGTB7NlYZbZ9n1wJVpdSL5K5gq98O3gE/edit?usp=sharing


## テーブル定義
https://docs.google.com/spreadsheets/d/1b1Q5IyqyVYp72vtFqO5_8Jt7Mp4FNbm7EJEYaNn4mEY/edit?usp=sharing


## 画面遷移図
https://docs.google.com/spreadsheets/d/1b3sEMgdfR3RLh4Kkh6fZXlQey_Td5pEcs41A1cb43Vs/edit?usp=sharing


## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1JNdn30eWSvzWOYhq7uVBd1YfIeUQhNr7jq3DHI5_qBc/edit?usp=sharing
