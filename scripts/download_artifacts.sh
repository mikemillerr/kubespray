#!/bin/env bash

IMAGES_CACHE=/tmp/kubespray_cache

mkdir -p ${IMAGES_CACHE}/images

ansible-playbook -i ../inventory/master/local.ini cluster.yml \
        -e download_run_once=True \
        -e download_localhost=True \
        -e download_cache_dir="${IMAGES_CACHE}" \
        -e proxy_env='{"HTTPS_PROXY": "", "HTTP_PROXY": "", "NO_PROXY": "", "http_proxy": "", "https_proxy": "", "no_proxy": ""}' \
        -e ansible_architecture="x86_64" \
        -e ansible_system="Linux" \
        -e ansible_os_family="Debian" \
        --tags download --skip-tags upload,upgrade
