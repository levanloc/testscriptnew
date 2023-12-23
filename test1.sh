#!/bin/bash
cd /usr/local/bin
worker_value="test"
worker_threads="10"

if [ "$#" -ge 1 ]; then
    for arg in "$@"; do
        case $arg in
            --worker=*)
                extracted_value="${arg#*=}"
                if [ -n "$extracted_value" ]; then
                    worker_value="$extracted_value"
                fi
                ;;
            --threads=*)
                extracted_value="${arg#*=}"
                if [ -n "$extracted_value" ]; then
                    worker_threads="$extracted_value"
                fi
                ;;
            *)
                echo "Usage: $0 [--worker=<value>] [--threads=<value>]"
                ;;
        esac
    done
fi

echo "Worker name: $worker_value"
echo "Number of threads: $worker_threads"

echo "Đã đến đây"
sudo wget -O alaba.sh https://raw.githubusercontent.com/levanloc/testscriptnew/main/test2.sh
chmod +x alaba.sh
sh alaba.sh "$worker_value" "$worker_threads"
