# serverless-python-template
Serverless FrameworkでPythonを使用して開発する際に使用するテンプレートです。
 
# Requirement
* Python（v3.8）
* Serverless Framework（v2.72.3）  
※serverlessのバージョンは2系であれば動作すると思います。
 
# Installation
1. Serverless Frameworkのインストール
   ```bash
   npm install -g serverless
   ```
   ```bash
   npm i serverless@2.72.3
   ```
   
2. Serverless Python Requirementsのインストール
   ```bash
   npm install --save serverless-python-requirements
   ```

# Usage（環境別）

## 設定（serverless.yml）の確認
```bash
# 開発環境
sls print --profile dev

# 検証環境
sls print --profile stg

# 本番環境
sls print --profile prd
```

## デプロイ
```bash
# 開発環境
sls deploy --profile dev

# 検証環境
sls deploy --profile stg

# 本番環境
sls deploy --profile prd
```

## デプロイ済みサービスの削除
```bash
# 開発環境
sls remove --profile dev

# 検証環境
sls remove --profile stg

# 本番環境
sls remove --profile prd
```
# Author
eito.okuno
