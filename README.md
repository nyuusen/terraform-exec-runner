# terraform-exec-runner

## 概要

Terraform実行用のDocker環境を作るファイルを置いているリポジトリ  
（モチベーションとしてはTerraform公式のDockerイメージがAlpineベースであること＋2025年6月時点の最新版で脆弱性が検知されていたこと）

## 使い方

このDockerfileをプロジェクト側に持っていき、ビルド＆起動してTerraformコマンドを実行する

### ビルド

Terraformバージョンの指定が可能

```sh
$ docker build --build-arg TERRAFORM_VERSION=1.5.7 -t terraform-exec-runner .
```

指定なしの場合は最新版がインストールされる

```sh
$ docker build -t terraform-exec-runner .
```


### 起動

- 対話モード(bash)で入って、その中で任意のTerraformコマンド実行
※マウントする場所はプロジェクトに合わせる

```sh
$ docker run --rm -it -v $(pwd):/app -w /app terraform-exec-runner bash
root@xxxxxxxxx:/# terraform init
```


## その他

- AWS等の認証情報は別途コンテナ側に渡す必要あり
- Lambda関数本体のビルドなどでPythonやNodeが必要な場合は、適宜Dockerfileに環境作る処理を追加する必要あり
