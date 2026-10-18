# Register the marketplace only; customers choose plugins separately.
& {
    $ErrorActionPreference = 'Stop'
    $marketplace = 'teknologika'
    $repository = 'https://github.com/teknologika/chatgpt-plugins.git'
    try {
        if ($env:OS -ne 'Windows_NT') {
            throw 'This installer is for Windows. Use install-mac.sh on macOS.'
        }
        if (-not (Get-Command codex -ErrorAction SilentlyContinue)) {
            throw 'The codex command was not found. Install Codex CLI using https://developers.openai.com/codex/cli/ then reopen PowerShell and try again.'
        }
        & codex plugin marketplace add --help *> $null
        if ($LASTEXITCODE -ne 0) {
            throw 'Your Codex version does not support marketplace registration. Update Codex and try again.'
        }
        $sources = & codex plugin marketplace list
        if ($LASTEXITCODE -ne 0) { throw 'Could not read your marketplaces. No changes were made.' }
        $pattern = '^' + [regex]::Escape($marketplace) + '\s'
        if ($sources | Where-Object { $_ -match $pattern }) {
            Write-Host 'Our ChatGPT plugin marketplace is already registered. Its existing source has been kept.'
            Write-Host 'Now visit https://tek.coach/m/CapitalCities to install Capital Cities.'
            return
        }
        Write-Host 'Add our ChatGPT plugin marketplace?'
        Write-Host "Source: $repository (main)"
        Write-Host 'This registers a plugin catalog. It does not install any plugins.'
        $reply = Read-Host 'Continue? [Y/n]'
        if ($reply -ne '' -and $reply -notmatch '^(?i:y|yes)$') {
            Write-Host 'Cancelled. No changes were made.'
            return
        }
        & codex plugin marketplace add $repository --ref main
        if ($LASTEXITCODE -ne 0) {
            throw 'Registration failed. Check your internet connection and that the repository has been published, then try again.'
        }
        $sources = & codex plugin marketplace list
        if ($LASTEXITCODE -ne 0 -or -not ($sources | Where-Object { $_ -match $pattern })) {
            throw 'Registration could not be verified. Check the Plugins page before trying again.'
        }
        Write-Host 'Marketplace added!'
        Write-Host 'Now visit https://tek.coach/m/CapitalCities to install Capital Cities.'
        Write-Host 'If the marketplace does not appear in the app, restart the app.'
    }
    catch {
        Write-Error -Message $_.Exception.Message -ErrorAction Continue
        throw
    }
}
