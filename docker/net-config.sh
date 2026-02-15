#!/bin/bash

echo "[INFO] Starting network configuration..."

# --- SETUP ATTACKER
docker exec -it attacker bash -c "ip route del default || true; ip route add default via 10.0.1.1"

# --- SETUP ATTACKER ROUTER
docker exec -it attacker_router bash -c "ip route add 10.0.2.0/24 via 10.0.100.2;"
docker exec -it attacker_router bash -c "ip route add 10.0.3.0/24 via 10.0.100.2;"

# --- SETUP FIREWALL
docker exec -it firewall bash -c "ip route add 10.0.1.0/24 via 10.0.100.1 || true"
docker exec -it firewall bash -c "ip route add 10.0.3.0/24 via 10.0.2.2 || true"

# --- SETUP INTERNAL ROUTER
docker exec -it internal_router bash -c "ip route add 10.0.1.0/24 via 10.0.2.1 || true"

# --- SETUP VICTIM
docker exec -it victim bash -c "ip route del default || true; ip route add default via 10.0.3.1"

echo "[OK] Configuration compleated!"