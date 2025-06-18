#!/bin/bash
#
if [[ -z "$OPENAI_API_KEY" ]]; then
  echo "API Key not found"
  exit 1
fi

DIFF=$(git diff --cached)

if [[ -z "$DIFF" ]]; then
  echo "No staged changes to analyze"
  exit 1
fi

PROMPT="Quiero que seas un generador de mensajes de commit usando el estándar Conventional Commits. Debes devolver **solo una línea** que empiece con alguno de estos prefijos: 'feat:', 'fix:', 'refactor:', 'chore:', 'test:', seguido de un espacio y una descripción clara, en ingles, en modo imperativo, sin punto final. No expliques, no des contexto, no uses comillas ni ningún otro texto extra. Tu respuesta debe ser solo el mensaje de commit. Aquí está el diff:\n\n$DIFF"

JSON=$(jq -n \
  --arg model "gpt-3.5-turbo" \
  --arg prompt "$PROMPT" \
  '{
    model: $model,
    messages: [
      {role: "system", content: "Sos un generador experto en Conventional Commits en ingles"},
      {role: "user", content: $prompt}
    ],
    temperature: 0.4
  }')

RESPONSE=$(curl -s https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d "$JSON")

COMMIT_MSG=$(echo "$RESPONSE" | jq -r '.choices[0].message.content')

echo -e "\nSuggested commit message:"
echo -e "\"$COMMIT_MSG\""

read -p "Use this message? [y/N]: " CONFIRM
if [[ "$CONFIRM" == "y" || "$CONFIRM" == "Y" ]]; then
  git commit -m "$COMMIT_MSG"
  echo "Commit updated"
else
  echo "Canceled"
fi