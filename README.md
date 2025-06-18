# terraform-exec-runner

## 概要

Terraform実行用のDocker環境を作るファイルを置いているリポジトリ

## 使い方

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

```sh
$ docker run terraform-exec-runner

Terraform v1.5.7
on linux_arm64
```

- 起動(対話型モード)

```sh
$ docker run -it terraform-exec-runner bash
```