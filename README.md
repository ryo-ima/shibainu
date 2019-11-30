Shibainu
====
家計簿アプリです。支出について消費・浪費・投資の３つに分けて管理できます。



## 概要
### 主な機能

- 日々の収支を入力することができる。
- 支出については割合が視覚的にわかりやすくなるように円グラフを表示される。
- 割合によって柴犬からコメントをもらう（未実装これから追加予定）

### 入力分類に困ったら。。こう分けましょう
- 消費……家賃や食費、光熱費、携帯電話料金、交通費といった生活していくうえで必要な支出。
- 浪費……衝動買いした洋服、何気なく食べているスイーツ、意味のない飲み会など、支払った額以上の効果が期待できない支払い。
- 投資……書籍、資格取得のための費用、健康増進のための食品やスポーツクラブの会員費など、将来の自分に利益をもたらすお金の使い方。



## イメージ図
[![Image from Gyazo](https://i.gyazo.com/8ed1bc5ac83193967b123db4df66f8d8.png)](https://gyazo.com/8ed1bc5ac83193967b123db4df66f8d8)

## URL
[Herokuにてデプロイ](https://shibainusyoroto.herokuapp.com/)


## Install
後日追記

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)



# DB設計

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :income_values, dependent: :destroy
- has_many :variablecost_values, dependent: :destroy

## Income_Valuesテーブル

|Column|Type|Options|
|------|----|-------|
|title|integer|null: false|
|year_month|date|null: false|
|value|integer|null: false|
|description|string|null: false|
|user_id|reference|null: false, foreign_key: true|


### Association
- belongs_to :user

## Variablecost_Valuesテーブル

|Column|Type|Options|
|------|----|-------|
|title|integer|null: false|
|year_month|date|null: false|
|value|integer|null: false|
|description|string|null: false|
|user_id|reference|null: false, foreign_key: true|


### Association
- belongs_to :user
