Name
====
Python、R、Postgres汎用分析環境

Overview
====
- Python、R、Postgresによる統合分析環境
- Python＋RのnotebookコンテナとPostgresコンテナを同時に立ち上げ、仮想ネットワークでリンクさせる

Description
====
- Dockerfile(Dockerfile.notebook, Dockerfile.postgres)
- docker-compose.yml
- docker/db/init/1_init.sql

Requirement
====
- Docker(Windows 10 proffesional Edition, macOS)
- Docker Toolbox(Windows 10 home edition)

Install
====
- $ git clone [Repository URL] ※
- $ cd analytics-enviromnent
- $ docker-compose up -d --build

※ OSユーザーのホームディレクトリ配下以外にダウンロードする場合、Dockerの共有設定が別途必要となります

※ Windowsでgitを利用する場合、デフォルト設定でのインストールを行うとスクリプトの改行コードを変えられてしまい、データベースを正しく構築できないことがあります

※ 改行を変えないよう設定するか、ZIPをダウンロードして利用してください

※ コンテナは作成されたがデータベースに接続できない、という場合の多くはディレクトリに対するアクセス権限設定の問題となります

※ Docker Toolboxでのコンテナ作成がうまく行かない場合、Gitのbashプロンプトから実行するとうまく作成できたという報告も見られます



Usage
====
- Docker Desktopの場合
http://localhost:8890

- Docker Toolboxの場合
http://192.168.99.100:8890

- SQLクライアントからのアクセス
  - PORT:5432
  - USER NAME：jedi
  - PASSWORD:jedi12345
  - DATABASE:jedi_db

Author
====
- Data Analylics Labo, ltd.

LICENSE
====
- MITライセンスに従います
