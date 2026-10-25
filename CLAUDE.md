# Working in this repository

This repo holds Claude skills, one folder per skill under `skills/`.

## Conventions

- Folder name is kebab-case and matches the `name` in the SKILL.md frontmatter.
- The `description` says when to use the skill, with a narrow trigger. Under 1024 characters, no angle brackets.
- SKILL.md holds the process and the rules, and stays under about 250 lines. Detail goes into subfolders (`references/`, `templates/`, or a topic folder like `council/`) and SKILL.md says when to read each file, by relative path.
- All skill text follows `skills/idea-to-spec/references/writing-rules.md`: plain words, no filler, no AI vocabulary.
- Third-party material keeps its license and a NOTICE with credit and a list of changes, inside the skill folder.
- When adding or changing a skill, update the skills table in `README.md`.

## Building

`scripts/package.sh [name]` writes `dist/<name>.zip` for upload in the Claude app. `dist/` is git-ignored.

## Working with the owner

Skills here are designed with the owner in short rounds: at most 3 questions per message, each with context, options with trade-offs and a recommendation. Unanswered points stay open. Don't treat silence as agreement.
