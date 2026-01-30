# Devcontainer Templates

This repo hosts reusable devcontainer templates for projects and teams.

## Quickstart

Use a template by referencing its image in `devcontainer.json`:

```json
{
  "name": "My Project",
  "image": "ghcr.io/lloydrichards/devcontainer-templates/web-app:latest"
}
```

See `docs/catalog.md` for all templates and `docs/learning/` for a short
learning path.

## Repository layout

- `src/<template-id>`: Template definitions.
- `test/<template-id>`: Template tests.
- `docs/templates`: Template docs.

## Add a template

1. Copy an existing template folder in `src/`.
2. Update `devcontainer-template.json` and `.devcontainer/devcontainer.json`.
3. Add a test in `test/<template-id>/test.sh`.
4. Add docs in `docs/templates/<template-id>.md` and update the catalog.

## Publish

Publishing will use `devcontainer templates publish` to GHCR. The workflow
will be added once the initial set of templates is stable.
