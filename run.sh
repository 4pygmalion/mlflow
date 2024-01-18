#!/bin/bash

CONFIG_FILE="config.txt"

# Function to prompt user for input and update environment variable
prompt_and_set() {
    read -p "Enter $1: " input
    export $2="$input"
    echo "$2 set to: $input"
    echo "$2=\"$input\"" >> "$CONFIG_FILE"
}

# Check if config file exists, and if so, remove it
if [ -f "$CONFIG_FILE" ]; then
    echo "Removing existing $CONFIG_FILE"
    rm "$CONFIG_FILE"
    echo "Created new $CONFIG_FILE"lear
fi

# Check if 'docker compose' command is available, and use the appropriate one
if command -v docker &> /dev/null; then
    COMPOSE_COMMAND="docker compose"
elif command -v docker-compose &> /dev/null; then
    COMPOSE_COMMAND="docker-compose"
else
    echo "Error: Neither 'docker-compose' nor 'docker compose' command found."
    exit 1
fi


prompt_and_set "MYSQL_DATABASE" "MYSQL_DATABASE"
prompt_and_set "MYSQL_USER" "MYSQL_USER"
prompt_and_set "MYSQL_PASSWORD" "MYSQL_PASSWORD"
prompt_and_set "MYSQL_ROOT_PASSWORD" "MYSQL_ROOT_PASSWORD"
prompt_and_set "MYSQL_DIR" "MYSQL_DIR"
prompt_and_set "ARTIFACT_DIR" "ARTIFACT_DIR"
prompt_and_set "MLFLOW_PORT" "MLFLOW_PORT"

$COMPOSE_COMMAND pull
$COMPOSE_COMMAND build --pull
$COMPOSE_COMMAND up --build --remove-orphans --detach