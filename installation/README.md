# Register our ChatGPT plugin marketplace

These scripts register the marketplace only. Customers install individual plugins afterwards. They require the `codex` command with marketplace support; installing the desktop app alone does not guarantee that command is available. No administrator access is requested by these scripts.

## Mac

Open Terminal and paste:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/teknologika/chatgpt-plugins/main/installation/install-mac.sh)"
```

## Windows

Open PowerShell and paste:

```powershell
& ([scriptblock]::Create((Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/teknologika/chatgpt-plugins/main/installation/install-windows.ps1')))
```

Each command downloads and runs the script from this repository. Scripts show the source and request confirmation before registration. Existing marketplace registrations are kept. Organisation policies may block script execution or marketplace registration; the installer does not change those policies.

After registration, visit https://tek.coach/m/CapitalCities to install Capital Cities. The website page must be deployed separately.

## Release status

Download commands require these files to be published on `main`; they do not work before publication. No installer has been deployed at tek.coach. Local mocked checks cover the Mac script; Windows execution and real GitHub registration still require end-to-end testing on supported clients.

## Remove the marketplace

```sh
codex plugin marketplace remove teknologika.com
```

This unregisters the source; it does not promise to uninstall previously installed plugins.
