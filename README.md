# mlflow
machine learning lifecycle sys

# Install
- GCP 이용시 (invalid Host header 오류발생) -> 최신버전 도커설치 필요
```
$ sudo snap refresh docker --channel=latest/edge
```

0. Docker official image pull
```
$ docker pull ghcr.io/mlflow/mlflow
```

1. DB setting
```/bin/bash
$ export MYSQL_DATABASE=<db_name>
$ export MYSQL_USER=<user>
$ export MYSQL_PASSWORD=<password>
$ export MYSQL_ROOT_PASSWORD=<root_password>
$ export MYSQL_DIR=<host_mysql_dir>

// example
export MYSQL_DATABASE=mlflow
export MYSQL_USER=mlflow
export MYSQL_PASSWORD=mlflow
export MYSQL_ROOT_PASSWORD=mlflow
export MYSQL_DIR=/home/hoheon/repositories/mlflow_db
```

2. MLflow trackign server setting
```/bin/bash
$ export MLFLOW_PORT=<mlflow_port>
$ export ARTIFACT_DIR=<artifact_dir>

//exmaple
export MLFLOW_PORT=5000
export ARTIFACT_DIR=/home/hoheon/repositories/mlflow
```


3. Run
```/bin/bash
$ docker compose pull
$ docker compose build --pull
$ docker compose up --build --remove-orphans --detach # build after pull latest
```

With sudo
```/bin/absh
$ sudo -E docker-compose pull (-E option: 환경변수 유지)
$ sudo -E docker-compose build --pull
$ sudo -E docker-compose up --build --remove-orphans --detach
```
