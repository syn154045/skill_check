## 概要

エンジニア中途採用の技術課題です。  
プラン表に従った料金計算を行うプログラムを作成してください。  

詳しい要求仕様については [spec.md](spec.md) を参照してください。

## Install

Docker を事前にインストールください。

```shell
# fork した場合は、それに合わせて URL を変更してください
git clone git@github.com:ingage/interview-skill-check.git
cd interview-skill-check

docker-compose build
docker-compose up -d
```

以下の URL でアクセスできることを確認してください。

- バックエンドエンジニア応募の方: http://localhost:3000/test
- フロントエンドエンジニア応募の方: http://localhost:3035

## プログラムの提出について
このリポジトリを fork して、forkしたリポジトリのソースを修正してください。  
ライブラリなどは自由に追加していただいてOKです。  

また、修正したコードは事前に弊社エンジニアも確認します。  
期限日までに `git push` して、 リモートブランチへ反映し、PR の提出もお願いします。  
※ **PR は fork したリポジトリ内に作成してください。**  
※ 期限日までに完了しなかった場合も、できている部分までで構いませんので、ご提出ください。  

仕様で不明点等あれば、ご自身で検討して実装を進めて頂いて構いません。  
質問などがある場合には、 dev@ingage.jp 宛に、件名の頭に `【採用課題質問】` とつけて、メールでお願いします。

## 当日について
課題を元に、ソースコードのレビューを行います。  
大阪本社での面接の場合、もし可能であれば当日パソコンを持参していただき、作成内容を発表してください。  
パソコンの持参が難しい場合には、教えていただけるとありがたいです。

また、できれば期限日までの完成を目指していただきたいと思っていますが、
もし完成していない場合は、完成させた上で当日のレビューに臨んでもらいたいと思っています。

## 現環境の補足
基本的には、`Rails 6.1` の構成です。  
また、`active_record`に関しては、除去しています。
