# Devcontainer Templates

This repo hosts reusable devcontainer templates for projects and teams.

## Quickstart

Use a template by referencing its image in `devcontainer.json`:

```jsonc
{
  "name": "My Project",
  "image": "ghcr.io/lloydrichards/devcontainer-templates/web-app:latest"
  // "features": { ...  },
  // "customizations": { ...  }
}
```

### Available templates

Template IDs map to `src/` folder names and GHCR image names.

| Template ID | Image (latest) |
| --- | --- |
| `mobile-app` | `ghcr.io/lloydrichards/devcontainer-templates/mobile-app:latest` |
| `web-app` | `ghcr.io/lloydrichards/devcontainer-templates/web-app:latest` |
| `web-app-fullstack` | `ghcr.io/lloydrichards/devcontainer-templates/web-app-fullstack:latest` |

Pin a version by replacing `latest` with a published tag (for example `:v0.3.1`).

## Repository layout

- `src/<template-id>`: Template definitions.
- `test/<template-id>`: Template tests.

## Add a template

1. Copy an existing template folder in `src/`.
2. Update `devcontainer-template.json` and `.devcontainer/devcontainer.json`.
3. Add a test in `test/<template-id>/test.sh`.
4. Add docs in `docs/templates/<template-id>.md` and update the catalog.

## Publish

Publishing will use `devcontainer templates publish` to GHCR. The workflow
will be added once the initial set of templates is stable.
