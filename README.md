# teknologika.com ChatGPT plugins

## Capital Cities

Practise world capitals with a 20-country quiz, hints, scoring and a review round. No external service connection or API key is required.

## Installation

Requires a supported client with the `codex` command available. Once this repository is published on `main`, register the marketplace once:

```sh
codex plugin marketplace add https://github.com/teknologika/chatgpt-plugins.git --ref main
```

Then install Capital Cities:

```sh
codex plugin add capital-cities@teknologika.com
```

Start a new chat and ask: **Use Capital Cities to start a five-question quiz.**

The repository marketplace is separate from OpenAI's public plugin directory. See [Mac and Windows setup](installation/README.md) for marketplace registration scripts.

## Licence

Installation and use, including internal business use, are permitted. Commercialising the plugin or modified versions requires written permission. Free sharing must retain the same terms. See [LICENSE](LICENSE).
