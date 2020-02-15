# UECS PostgreSQL

PostgreSQL DBにUECSデータを収めるスキームを記述する。

受信には uecs/recvdata.py などを用いる。

広域におけるNODE,CCMデータの重複は考慮しない。DBを増やすことで対応する。

DBは複数個作成するが、USERは、問題がなければ少ない方が管理が楽になる。

## How to Setup

ユーザなどを登録する前にPostgresqlのサーバを起動する。

    # systemctl start postgresql-12

下記は、user0 というユーザをパスワード付きで作成する。パスワードは、仮にUECS0とした。

    # createuser -U postgres -P uecs0

uecs0ユーザが作成されたら、DBを作成する。DB名は uecs0。

    # createdb -U postgres -O uecs0 uecs0


## DB Fields

### t_data (Data in a CCM record)

| Name     | Type                     | 省略時     | Remarks              |
|:--------:|:------------------------:|:----------:|:---------------------|
| TOD      | timestamp with time zone | now()      | 受信時のTOD          |
| VER      | text                     | '1.00-E10' | UECSの電文バージョン |
| CCMTYPE  | text                     | 不可       | CCMのtype            |
| ROOM     | integer                  | 不可       |                      |
| REGION   | integer                  | 不可       |                      |
| ORDER    | integer                  | 不可       |                      |
| PRIORITY | integer                  | 不可       |                      |
| VALUE    | bigint                   | 不可       | データ値             |
| IP       | inet                     | 不可       | IPアドレス           |

### t_MODE (NODE table)

| Name     | Type                     | 省略時     | Remarks              |
|:--------:|:------------------------:|:----------:|:---------------------|
| TOD      | timestamp with time zone | now()      | 受信時のTOD          |
| VER      | text                     | '1.00-E10' | UECSの電文バージョン |
| NAME     | text                     | 不可       |                      |
| VENDER   | text                     | NULL       |                      |
| UECSID   | char(12)                 | NULL       |                      |
| IP       | inet                     | 不可       | IPアドレス           |
| MACADDR  | macaddr                  | 不可       | MACアドレス          |

### t_CCM (CCM Table)

| Name     | Type                     | 省略時     | Remarks              |
|:--------:|:------------------------:|:----------:|:---------------------|
| TOD      | timestamp with time zone | now()      | 受信時のTOD          |
| VER      | text                     | '1.00-E10' | UECSの電文バージョン |
| NUM      | integer                  | 不可       | CCM No.              |
| CCMTYPE  | text                     | 不可       | CCMのtype            |
| ROOM     | integer                  | 不可       |                      |
| REGION   | integer                  | 不可       |                      |
| ORDER    | integer                  | 不可       |                      |
| PRIORITY | integer                  | 不可       |                      |
| CAST     | integer                  | 0          | 小数点下桁数         |
| UNIT     | text                     | NULL       | 単位                 |
| SR       | char(1)                  | 不可       | 送受信区別           |
| LV       | text                     | 不可       | A-1M-0などのレベル   |
| PRIORITY | integer                  | 不可       |                      |
