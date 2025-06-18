# Ubuntu最新版をベースにする
FROM ubuntu:latest

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y \
    curl \
    gpg

# Terraformのインストール準備
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

ARG TERRAFORM_VERSION

# Terraformバージョン指定があればそのバージョン/なければ最新をインストール
RUN if [ -n "$TERRAFORM_VERSION" ]; then \
# ※リビジョン番号は「-1」を固定で指定しているので注意
apt-get update && apt-get install -y terraform=${TERRAFORM_VERSION}-1; \
else \
apt-get update && apt-get install -y terraform; \
fi

# 不要なAPT関連のキャッシュやパッケージリストを削除
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD [ "terraform", "-v" ]