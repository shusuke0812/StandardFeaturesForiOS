Swiftを使ったiOSアプリ開発に良く使う機能一覧
====
　
## 開発環境
- Xcode version 12
- pod version 1.9.1
- MacOS Catalina version 10.15.4

## 概要
### 背景と目的
- 良く使う機能をまとめ、次の開発に活かすこと 
- 機能は、UIだけでなく開発時のデバッグ方法なども含む

### アプリの要件
- 各機能のUIは、tableViewのセクション表示でまとめて見やすくする
- セクション毎のセルをタップした遷移先に機能を実装する

### 機能一覧
- アプリコア機能
	- ログイン
	- 広告
	- お問い合わせ（mailer）
	- オンボーディング（アプリの使い方）
	- プッシュ通知
	- 利用規約、プライバシーポリシー
- アプリサブ機能
	- カルーセル表示 [済]
	- ラベル長押しコピー[済]
	- アコーディオンメニュー[済]
	- アラート[済]
	- ハーフモーダル
	- ウィジェット
- アプリ連携機能
	- ヘルスケアアプリ[済]
- テスト
- パフォーマンス計測

## 参考文献
- [アコーディオンメニュー](https://github.com/nRewik/UIStackViewEasyAnimation), [もっと見るボタン](https://qiita.com/kimioman/items/277dcc3a8bf59eba9751)
- [HealthKit導入（Apple Dev Documentation）](https://developer.apple.com/documentation/healthkit/setting_up_healthkit)


