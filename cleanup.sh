#!/usr/bin/env bash

set -o pipefail

echo "[info] checking container(s) running state"
echo

if docker compose ls | grep "running" >/dev/null; then
  docker compose ls
else
  echo "* skipped, no container running"
  exit 0
fi

echo
echo "VOLUMES"
TARGET_VOLUMES=$(docker volume list -f dangling=false | grep "$(awk -F'=' /COMPOSE_PROJECT_NAME/'{print$2}' .env)" | awk '{print$2}')
for v in ${TARGET_VOLUMES[@]}; do echo ${v}; done

echo
printf "\033[1;31mWARNING:\033[1;33m it's going to cleanup everything created by docker-compose.yaml, and there's no way back !!!\033[m\n"
echo
read -p "Type [yes] to continue or any key to exit: " YES_OR_NO
echo
read -p "Include volumes? Type [yes] or any key to skip: " INCLUDE_VOLUMES
echo

if [ "${YES_OR_NO}" = "yes" ]; then
  if [ "${INCLUDE_VOLUMES}" = "yes" ]; then
    echo "[info] shutting down containers defined in docker-compose.yaml (including volumes)"
    echo
    docker compose down

    echo "[info] removing volumes"
    for v in ${TARGET_VOLUMES[@]}; do docker volume rm ${v}; done
  else
    echo "[info] shutting down containers defined in docker-compose.yaml (volumes excluded)"
    echo
    docker compose down
  fi
else
  echo "* skipped, nothing happen"
fi
