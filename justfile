# The default recipe when just is called without arguments
default: serve

serve:
    mdbook serve

test:
    just lint
    mdbook build

lint:
    markdownlint-cli2 "**/*.md"

lint-fix:
    markdownlint-cli2 --fix "**/*.md"
