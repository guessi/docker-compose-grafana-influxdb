#!/usr/bin/env bash

echo "[info] checking container(s) running state"
echo

if docker compose ls | grep "running" >/dev/null; then
  docker compose ls
else
  echo "* skipped, no container running"
  exit 0
fi

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
    cat docker-compose.yaml \
      | grep -B 1 'external:' \
      | grep -v 'external:' \
      | grep -v '^--$' \
      | sed 's/[ :]//g' \
      | xargs docker compose down --volumes
  else
    echo "[info] shutting down containers defined in docker-compose.yaml (volumes excluded)"
    echo
    docker compose down
  fi
else
  echo "* skipped, nothing happen"
fi
