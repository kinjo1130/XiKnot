# Astro Starter Kit: Minimal

```sh
npm create astro@latest -- --template minimal
```

> 🧑‍🚀 **Seasoned astronaut?** Delete this file. Have fun!

## 🚀 Project Structure

Inside of your Astro project, you'll see the following folders and files:

```text
/
├── public/
├── src/
│   └── pages/
│       └── index.astro
└── package.json
```

Astro looks for `.astro` or `.md` files in the `src/pages/` directory. Each page is exposed as a route based on its file name.

There's nothing special about `src/components/`, but that's where we like to put any Astro/React/Vue/Svelte/Preact components.

Any static assets, like images, can be placed in the `public/` directory.

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |

## 👀 Want to learn more?

Feel free to check [our documentation](https://docs.astro.build) or jump into our [Discord server](https://astro.build/chat).

## 🚀 Cloud Run デプロイ

### ローカルでDockerビルド確認

```bash
docker build -t company-page .
docker run -p 8080:8080 company-page
# ブラウザで http://localhost:8080 を確認
```

### 手動デプロイ

```bash
./deploy.sh
# または引数指定: ./deploy.sh PROJECT_ID REGION
```

### Cloud Build による自動デプロイ

GitHubリポジトリと連携し、`cloudbuild.yaml`を使用して自動デプロイが可能です。

### Cloud Run 設定

| 項目 | 値 |
|------|-----|
| リージョン | asia-northeast1 (東京) |
| メモリ | 256Mi |
| 最小インスタンス | 0 (スケールtoゼロ) |
| 最大インスタンス | 10 |
| 同時実行数 | 80 |

### 推定コスト

- **アイドル時**: 無料（min-instances=0）
- **月額**: 約$0〜5（通常の会社HPトラフィック）

# XiKnot
