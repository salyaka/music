# Score Log
今までに弾いた曲や練習中の曲、弾きたい曲を記録するアプリです。<br>
<br>
![スクリーンショット 2021-03-28 20 18 38](https://user-images.githubusercontent.com/73941034/112753426-95aebd00-9012-11eb-8d3d-494c7e4c61dc.jpeg)

## URL
https://score-log.herokuapp.com/　<br>
ゲストログイン機能がございます。

## コンセプト
私は以前エレクトーンを習っていたときにレッスンノートを付けていました。<br>
先生に注意されたことや練習内容を記録し、練習した日にはカレンダーにチェックを入れるシンプルなものです。<br>
ですが、後から見返したときに自分の成長を実感でき、カレンダーが埋まっていくことがモチベーションにも繋がっていました。<br>
今でも趣味でエレクトーンを弾いているため、もっと簡単に記録出来たらと考え制作しました。

## 使い方
「楽譜を追加する」から簡単に楽譜を登録でき、登録状況ごとに楽譜を管理します。<br>
また詳細ページで練習記録を登録するとカレンダーに反映され、一目で練習状況を把握することができます。<br>
<br>
![image_72192707 (1)](https://user-images.githubusercontent.com/73941034/113001143-7c8d4400-91ab-11eb-946d-dc1f06232bc8.JPG)
![IMG_3900 (4)](https://user-images.githubusercontent.com/73941034/113001249-9595f500-91ab-11eb-8092-7caea47e5098.jpg)
![IMG_3902 (1)](https://user-images.githubusercontent.com/73941034/113001240-9464c800-91ab-11eb-9b7c-c1c1d9881da2.jpg)

## 開発環境・使用技術
* Ruby 2.7.2
* Rails 6.0.3.5
* SCSS
* JavaScript (JQuery)
* PostgreSQL 13.1
* AWS S3

## 機能一覧
* ユーザー登録、ログイン機能(devise)
* ゲストログイン機能
* 楽譜の登録、編集機能
* 画像投稿機能(CarrierWave)
* ログ機能
* ページネーション機能(kaminari)
* 楽譜のステータス管理機能(enum)
* カレンダー機能(flatpickr,simple_calendar)
