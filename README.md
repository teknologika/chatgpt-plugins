# teknologika.com ChatGPT plugins

## Capital Cities

Practise world capitals with a 20-country quiz, hints, scoring and a review round. No external service connection or API key is required.

## Hello World

A simple greeting plugin to test installation. After registering the marketplace, run `codex plugin add hello-world@teknologika`, start a new chat and ask **Use Hello World to say hello.**

## States of Australia

A separate local MCP test. Requires Node.js 20+, npm/npx, and a desktop host with local stdio MCP support. First launch downloads dependencies. The compiled server is bundled with the plugin; npx fetches the same archive from a commit-pinned public URL to avoid client-specific path expansion. No npm registry release is required.

```sh
codex plugin marketplace upgrade teknologika
codex plugin add states-of-australia@teknologika
```

Start a fresh chat and ask **Use States of Australia**. Choose NSW for a capital, VIC for a landmark, or QLD for a fact. The server selects the action and returns a unique request ID. WA, SA and TAS also work; ACT and NT are territories outside this test.

This tests local MCP execution, not cloud/web availability. Production can replace the local server with a PHP MCP endpoint in WordPress while preserving the tool contract. No WordPress changes are included.

## Installation

Requires a supported client with the `codex` command available. Once this repository is published on `main`, register the marketplace once:

```sh
codex plugin marketplace add https://github.com/teknologika/chatgpt-plugins.git --ref main
```

Then install Capital Cities:

```sh
codex plugin add capital-cities@teknologika
```

Start a new chat and ask: **Use Capital Cities to start a five-question quiz.**

The repository marketplace is separate from OpenAI's public plugin directory. See [Mac and Windows setup](installation/README.md) for marketplace registration scripts.

## Licence

Installation and use, including internal business use, are permitted. Commercialising the plugin or modified versions requires written permission. Free sharing must retain the same terms. See [LICENSE](LICENSE).
