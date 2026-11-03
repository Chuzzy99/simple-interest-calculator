#!/bin/bash
# Simple Interest Calculator
# Formula: Simple Interest = (Principal * Rate * Time) / 100

echo "=== Simple Interest Calculator ==="

read -p "Enter the principal amount: " principal
read -p "Enter the rate of interest (% per year): " rate
read -p "Enter the time period (in years): " time

# Validate that all inputs are numbers
for value in "$principal" "$rate" "$time"; do
  if ! [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: please enter positive numbers only."
    exit 1
  fi
done

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", (p * r * t) / 100 }')
total=$(awk -v p="$principal" -v i="$interest" 'BEGIN { printf "%.2f", p + i }')

echo "-------------------------------"
echo "Principal:       $principal"
echo "Rate of interest: $rate%"
echo "Time period:     $time years"
echo "Simple interest: $interest"
echo "Total amount:    $total"
