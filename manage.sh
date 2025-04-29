#!/bin/bash

case "$1" in
  create)
    echo "[+] Launching web-server..."
    multipass launch --name web-server --cloud-init cloud-init/web-server.yaml

    echo "[+] Launching log-server..."
    multipass launch --name log-server --cloud-init cloud-init/log-server.yaml

    echo "[+] Launching admin-node..."
    multipass launch --name admin-node --cloud-init cloud-init/admin-node.yaml

    echo "[✓] Waiting for provisioning to complete..."
    sleep 10
    multipass list
    ;;
  
  destroy)
    echo "[+] Deleting instances..."
    multipass delete web-server log-server admin-node
    multipass purge
    echo "[✓] All instances deleted and purged."
    ;;

  status)
    echo "[+] Current instance status:"
    multipass list
    ;;

  backup)
    echo "[+] Taking snapshots of instances..."
    multipass snapshot web-server
    multipass snapshot log-server
    multipass snapshot admin-node
    echo "[✓] Snapshots taken."
    ;;

  logs)
    echo "[+] Fetching cloud-init logs..."
    mkdir -p logs
    multipass transfer web-server:/var/log/cloud-init.log logs/web-server.log
    multipass transfer log-server:/var/log/cloud-init.log logs/log-server.log
    multipass transfer admin-node:/var/log/cloud-init.log logs/admin-node.log
    echo "[✓] Logs collected in ./logs folder."
    ;;

  *)
    echo "Usage: $0 {create|destroy|status|backup|logs}"
    exit 1
    ;;
esac
