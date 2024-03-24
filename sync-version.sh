#!/usr/bin/env bash
version=$(jq -r '.version' package.json)
echo 'Updating packages to version:' $version
jq -M --arg version $version '.version=$version' ./pumble-cli/package.json > ./pumble-cli/package.json
jq -M --arg version $version '.version=$version' ./pumble-sdk/package.json > ./pumble-sdk/package.json
jq -M --arg version $version '.devDependecies["pumble-cli"]=$version' ./pumble-cli/template/_package.json > ./pumble-cli/template/_package.json
jq -M --arg version $version '.dependencies["pumble-sdk"]=$version' ./pumble-cli/template/_package.json > ./pumble-cli/template/_package.json