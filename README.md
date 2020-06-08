# idol places
![logo](https://user-images.githubusercontent.com/59955191/83936009-0a9dd580-a7fa-11ea-9c6e-322960f0e4b4.png)

## サイトURL
https://idolplaces.site/

## サイト概要
アイドルのリリースイベントの情報共有サイト&イベント写真投稿プラットフォーム

### サイトテーマ
アイドルのリリースイベント情報をチェックしたり、自ら投稿できるサイトです。  
イベント情報を登録してマイカレンダーを作成できたり、現場で撮影した写真を投稿してシェアすることもできます。  
また、タイムライン機能やチャット機能でユーザー間の交流もできます。  

`+AI要素`
- リリースイベントで撮影した写真を'Vision API'で投稿することで場所(ラベル検出)やアイドル(顔検出)を行い、自動的にタグ付け出来ます。

- 場所に対してのコメント機能では'Natural Language API'を用いてレビューに対して感情分析を行い、自動的にスコアリングされます。

### テーマを選んだ理由
- アイドルのリリースイベント情報を一元化できるようなサイトがあれば、Twitterの情報をこまめに確認するといった手間や情報を見逃すということがなくなり、ユーザーにとって便利であると感じたため。

`+AI要素`
- 近年、撮影可能なアイドルが増えており、SNSでハッシュタグなどを付けて共有(拡散)されることがよくあり、演者側からも推奨されています。一方でその投稿は一過性のものとなり、時が経てば埋もれる傾向にあります。今回そのようなリリースイベントで撮影された写真のプラットフォーム的なサイトを'Vision API'を用いて制作したいため。

### ターゲットユーザ
アイドルオタク

`+AI要素`
- アイドル現場のカメコ(ライブを見ることより撮影を専門にする人達)

### 主な利用シーン
アイドルの現場検索時/イベントスケジュールを整理したい時

`+AI要素`
- カメコが自分の推しのベストショットを共有したい時

### ターゲットユーザの利用目的
アイドル現場の情報を一元化できる/自らイベント情報を投稿しスケジューラーとして使える

`+AI要素`
- カメコが自分の推しのベストショットを自慢できる。

### 他のサイトとの相違点
Twitterとの相違点  
- アイドル情報に特化している。  
- アイドル、場所、イベント、カレンダーの作成を行える。  
イベント情報サイトとの相違点  
- 現場写真を投稿できる。  
- 過去のイベントを検索、写真の閲覧及び投稿が出来る。  

### 会員登録 or ログインすると可能になる機能
- イベント/アイドル/場所新規作成(編集)機能
- いいね機能  
- マイカレンダー機能  
- コメント機能  
- フォロワー機能  
- タイムライン機能  
- チャット機能  

### 今後実装予定の機能
- タグ(人物名など)作成機能
- 写真集機能

## 設計書  

### WBS  
https://docs.google.com/spreadsheets/d/1EivZIr7Um58WVOV7p0q0lM8j41XdmhUC8PJIfJ9zRwA/edit#gid=611653277

### 機能一覧
https://docs.google.com/spreadsheets/d/1ExVhhcbcKmzYU44yxTJgWhSBqoRqdvGufpK0Mi6mj2U/edit#gid=0  

### 画面偏移図  
https://drive.google.com/drive/folders/16qw72xpCs7czk8TboFya1BFIbqzEENFI

### ワイヤーフレーム  
https://app.diagrams.net/#G11OIlncJb05mm0s8VxSxHElxQCtGjfPCV  

### ER図
https://app.diagrams.net/#G1HpOHCr8kNe8-51K2laWCIkHO_BatbpOj  

### テーブル定義書
https://docs.google.com/spreadsheets/d/1TW854Vn2hO4tYQ2qZO7Fa3szMSxQixEk4BG8rFVHVZQ/edit#gid=718951293  

### アプリケーション詳細設計
https://docs.google.com/spreadsheets/d/1sbePKlQd9TqRGltaDu0aufTw83mFGtAeeGcx392II54/edit#gid=0  
