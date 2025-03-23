#!/bin/sh

bat="$(cat /sys/class/power_supply/BAT0/capacity)"

case 1 in
	$((bat >= 85)) ) icon="  " ;;
	$((bat >= 75)) ) icon="  " ;;
	$((bat >= 50)) ) icon="  " ;;
	$((bat >= 25)) ) icon="  " ;;
	$((bat >= 10)) ) icon="  " ;;
	* ) echo ' ' && exit ;;
esac

echo "$icon$bat%"
