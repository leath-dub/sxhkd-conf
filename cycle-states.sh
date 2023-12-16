#!/bin/sh

focused=$(bspc query -T -n focused)
state=$(echo $focused | jq -r ".client.state")

case "$state" in
    tiled) new_state="floating" ;;
    floating) new_state="fullscreen" ;;
    fullscreen) new_state="tiled" ;;
esac

node_id=$(echo $focused | jq -r ".id")
bspc node $node_id -t $new_state
