#!/usr/bin/env bash

[ -e "${ROOTFS}"/usr/local/bin ] || mkdir -p "${ROOTFS}"/usr/local/bin
[ -e "/alpine-version" ] || {
    echo "Missing alpine-version file."
    exit 1
}

# copy apk repositories
ALPINE_VERSION="$(cat /alpine-version)"
cp /resources/apk-repositories "${ROOTFS}"/etc/apk/repositories
sed -i -r -e "s/\{alpine-version\}/${ALPINE_VERSION}/g" "${ROOTFS}"/etc/apk/repositories

# copy commands
COMMANDS=(
    add-pack
    entrypoint
)

for command in "${COMMANDS[@]}"; do
    cp /resources/"${command}" "${ROOTFS}"/usr/local/bin/"${command}"
    chmod +x "${ROOTFS}"/usr/local/bin/"${command}"
done
