# CLAUDECODE.md

```sh
alias claude="CLAUDE_CONFIG_DIR=~/.claude ~/.local/bin/claude"
alias claude-k="CLAUDE_CONFIG_DIR=~/.claude-k ~/.local/bin/claude"
```

```sh
rm -rf ~/.claude.json
rm -rf ~/.claude && mkdir -p ~/.claude
rm -rf ~/.claude-k && mkdir -p ~/.claude-k
```

```sh
echo $(cat settings.json)> ~/.claude/settings.json
echo $(cat settings.json)> ~/.claude-k/settings.json
```

```sh
claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp --header "CONTEXT7_API_KEY: {{ key }}"
claude-k mcp add --scope user --transport http context7 https://mcp.context7.com/mcp --header "CONTEXT7_API_KEY: {{ key }}"
```

```sh
claude mcp add primevue -s user -- npx -y @primevue/mcp
claude-k mcp add primevue -s user -- npx -y @primevue/mcp
```

```sh
/plugin install claude-code-setup@claude-plugins-official
/plugin install claude-md-management@claude-plugins-official
/plugin install code-review@claude-plugins-official
/plugin install frontend-design@claude-plugins-official
/plugin install gopls-lsp@claude-plugins-official
/plugin install playwright@claude-plugins-official
/plugin install pyright-lsp@claude-plugins-official
/plugin install superpowers@claude-plugins-official
/plugin install typescript-lsp@claude-plugins-official
```

```json
"enabledPlugins": {
  "claude-code-setup@claude-plugins-official": true,
  "claude-md-management@claude-plugins-official": true,
  "code-review@claude-plugins-official": true,
  "frontend-design@claude-plugins-official": true,
  "gopls-lsp@claude-plugins-official": true,
  "playwright@claude-plugins-official": true,
  "pyright-lsp@claude-plugins-official": true,
  "superpowers@claude-plugins-official": true,
  "typescript-lsp@claude-plugins-official": true
}
```
