# mlflow
machine learning lifecycle sys

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
```

2. MLflow trackign server setting
```/bin/bash
$ export MLFLOW_PORT=<mlflow_port>
$ export ARTIFACT_DIR=<artifact_dir>
```


3. Run
```/bin/bash
$ docker-compose pull
$ docker-compose build --pull
$ docker-compose up --build --remove-orphans --detach # build after pull latest
```

For Centos
```/bin/absh
$ sudo -E docker-compose pull  E (-E option: 환경변수 유지)
$ sudo docker-compose build --pull
$ sudo docker-compose up --build --remove-orphans --detach
```
