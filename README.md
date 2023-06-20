# 環境構築
参考: [Rails × Vue をdocker-composeで環境構築する](https://qiita.com/Shuhei_Nakada/items/148ce4c7c5bd4d11bcf0)

## 初期化（再初期化も）
※ makeコマンドについては`Makefile`に記載。詳細は`@alice0421`まで。
### rails
1. crypto関連のimage全削除
2. `make init`
3. `./src/rails/config/database.yml`を書き換えて、DBをつなげる
4. `./db`の削除 + crypto関係のimage全削除

### vue(railsに続けて)
1. `./src/vue/*`を全部消す
2. `make build`
3. `docker-compose run app ash`でappコンテナに入り、以下の作業を行う。
    - `npm init vite@latest`(viteでvueアプリの作成)
    - vue, TypeScript
    - `./src/vue/任意のvueアプリ名`内にvueアプリの構成ファイルが作成されてしまうので、`./src/vue/*`直下に全て移動させる
    - `npm install`
4. `./src/vue/vite.config.js`に以下を追加
    ```javascript
    ...
    export default defineConfig({
        plugins: [vue()],
        // 追加
        server:{
            host: true
        }
    })
   ```
5. `make up`
   
## git
1. `./src/rails/*`二移動して`rm -rf .git`
    - railsアプリの中にあるgitのせいで、全体をgitで管理できないため、削除する

# 使用技術
- Ruby on Rails
- Vue3
- TypeScript
- Docker

# 最終ファイル構成
```javascript
.
├── db // DBのデータ
├── docker // dockerの構成ファイル
│   ├── mysql
│   ├── rails
│   └── vue
├── src
│   ├── rails // railsアプリ
│   └── vue // vueアプリ
├── .env // docker用の環境変数
├── .gitignore
├── docker-compose.yml
├── Makefile // makeコマンド
└── README.md
```
# 概要
- 自分で決めた法則で、様々な文字や記号を暗号化できるアプリ。
- 自分の作った暗号を投稿し、暗号解読ゲームとしても使用可能。

※ セキュリティ面での保証はできかねないので、あくまで遊びとしてお使いください。
