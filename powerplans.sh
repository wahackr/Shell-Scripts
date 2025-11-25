#!/bin/bash

echo "Select CPU performance profile:"
echo "1) performance"
echo "2) balanced"
echo "3) power-saver"
read -rp "Enter choice [1-3]: " choice

case $choice in
  1)
    profile="performance"
    ;;
  2)
    profile="balanced"
    ;;
  3)
    profile="power-saver"
    ;;
  *)
    echo "Invalid choice"
    exit 1
    ;;
esac

echo "Setting power profile to '$profile'..."
powerprofilesctl set "$profile"

if [ $? -eq 0 ]; then
  echo "Power profile set to '$profile' successfully."
else
  echo "Failed to set power profile."
fi

