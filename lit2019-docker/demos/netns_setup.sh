#!/bin/bash

# Zwei neue interfaces, die mit einem virtuellen Ethernetkabel
# verbunden sind
ip link add name c_host0 type veth peer name c_client0

# Verschiebe eins in den namespace
ip link set c_client0 netns container

# IP Adressen 
ip addr add 10.0.0.1/24 dev c_host0
ip netns exec container ip addr add 10.0.0.2/24 dev c_client0

# Einschalten
ip link set c_host0 up
ip netns exec container ip link set c_client0 up
