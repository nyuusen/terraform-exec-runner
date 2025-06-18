# terraform-exec-runner

## 概要

ローカルにTerraformとPythonの環境を作るのが面倒だったので作ったTerraform実行用のDocker環境を作るためのリポジトリです。

## 使い方

### ビルド

TerraformおよびPythonバージョンの指定が可能です。

```sh
$ docker build --build-arg TERRAFORM_VER=1.5.7 -t terraform-exec-runner .
```

指定なしの場合は最新版がインストールされます

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