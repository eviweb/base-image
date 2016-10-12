#!/usr/bin/env bash

[ -e "${ROOTFS}"/usr/local/bin ] || mkdir -p "${ROOTFS}"/usr/local/bin

# copy apk repositories
cp /resources/apk-repositories "${ROOTFS}"/etc/apk/repositories

# copy commands
COMMANDS=(
    add-pack
    entrypoint
)

for command in "${COMMANDS[@]}"; do
    cp /resources/"${command}" "${ROOTFS}"/usr/local/bin/"${command}"
    chmod +x "${ROOTFS}"/usr/local/bin/"${command}"
done
