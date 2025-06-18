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

# Terraformバージョン指定があればそのバージョン/なければ最新をインストール
ARG TERRAFORM_VER

RUN if [ -n "$TERRAFORM_VER" ]; then \
# リビジョン番号は「-1」を固定で指定している
apt-get update && apt-get install -y terraform=${TERRAFORM_VER}-1; \
else \
apt-get update && apt-get install -y terraform; \
fi

# Pythonバージョンを指定
ARG PYTHON_VER

# Terraformバージョンをdump
CMD [ "terraform", "-v" ]