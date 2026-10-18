#!/bin/bash
# Register the marketplace only; customers choose plugins separately.
set -euo pipefail

marketplace='teknologika'
repository='https://github.com/teknologika/chatgpt-plugins.git'

if [ "$(uname -s)" != Darwin ]; then
  printf '%s\n' 'This installer is for macOS. Use install-windows.ps1 on Windows.' >&2
  exit 1
fi
if ! command -v codex >/dev/null 2>&1; then
  printf '%s\n' 'The codex command was not found.' 'Install Codex CLI using the official instructions, then reopen Terminal and try again:' 'https://developers.openai.com/codex/cli/' >&2
  exit 1
fi
if ! codex plugin marketplace add --help >/dev/null 2>&1; then
  printf '%s\n' 'Your Codex version does not support marketplace registration. Update Codex and try again.' >&2
  exit 1
fi
if ! sources=$(codex plugin marketplace list); then
  printf '%s\n' 'Could not read your marketplaces. No changes were made.' >&2
  exit 1
fi
if printf '%s\n' "$sources" | awk -v name="$marketplace" '$1 == name { found=1 } END { exit !found }'; then
  printf '%s\n' 'Our ChatGPT plugin marketplace is already registered. Its existing source has been kept.' 'Now visit https://tek.coach/m/CapitalCities to install Capital Cities.'
  exit 0
fi
printf '%s\n' 'Add our ChatGPT plugin marketplace?' "Source: $repository (main)" 'This registers a plugin catalog. It does not install any plugins.'
printf '%s' 'Continue? [Y/n] '
reply=''
if ! read -r reply; then
  printf '\n%s\n' 'Cancelled. No changes were made.'
  exit 0
fi
case "$reply" in ""|y|Y|yes|YES|Yes) ;; *) printf '%s\n' 'Cancelled. No changes were made.'; exit 0 ;; esac
if ! codex plugin marketplace add "$repository" --ref main; then
  printf '%s\n' 'Registration failed. Check your internet connection and that the repository has been published, then try again.' >&2
  exit 1
fi
if ! sources=$(codex plugin marketplace list) || ! printf '%s\n' "$sources" | awk -v name="$marketplace" '$1 == name { found=1 } END { exit !found }'; then
  printf '%s\n' 'Registration could not be verified. Check the Plugins page before trying again.' >&2
  exit 1
fi
printf '%s\n' 'Marketplace added!' 'Now visit https://tek.coach/m/CapitalCities to install Capital Cities.' 'If the marketplace does not appear in the app, restart the app.'
