#!/usr/bin/env bash
# Commits and pushes any pending changes so GitHub Pages redeploys the site.
cd "$(dirname "$0")/.." || exit 0
[ -z "$(git status --porcelain)" ] && exit 0
git add -A
git commit -q -m "Atualiza site ($(date '+%Y-%m-%d %H:%M'))" || exit 0
if git push -q origin main 2>/tmp/auto-deploy-err.txt; then
  echo '{"systemMessage": "Alterações publicadas no GitHub Pages (atualiza em ~1 min)."}'
else
  echo '{"systemMessage": "Commit feito, mas o push falhou. Rode git push no terminal para autenticar no GitHub."}'
fi
