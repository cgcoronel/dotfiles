#!/bin/bash

# Validar API key
if [[ -z "$OPENAI_API_KEY" ]]; then
  echo "API Key not found"
  exit 1
fi

# Obtener el diff del último commit
DIFF=$(git diff HEAD^..HEAD)

if [[ -z "$DIFF" ]]; then
  echo "No diff to analyze"
  exit 1
fi

# Armar prompt como una sola línea escapando bien
PROMPT="Quiero que seas un generador de mensajes de commit usando el estándar Conventional Commits. Debes devolver **solo una línea** que empiece con alguno de estos prefijos: 'feat:', 'fix:', 'refactor:', 'chore:', 'test:', seguido de un espacio y una descripción clara, en ingles, en modo imperativo, sin punto final. No expliques, no des contexto, no uses comillas ni ningún otro texto extra. Tu respuesta debe ser solo el mensaje de commit. Aquí está el diff:\n\n$DIFF"

# Usar jq para escapar correctamente el contenido
JSON=$(jq -n \
  --arg model "gpt-4" \
  --arg prompt "$PROMPT" \
  '{
    model: $model,
    messages: [
      {role: "system", content: "Sos un generador experto en Conventional Commits en ingles"},
      {role: "user", content: $prompt}
    ],
    temperature: 0.4
  }')

# Ejecutar llamada a OpenAI
RESPONSE=$(curl -s https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d "$JSON")

# Extraer respuesta
COMMIT_MSG=$(echo "$RESPONSE" | jq -r '.choices[0].message.content')

# Mostrar resultado
echo -e "\nSuggested commit message:"
echo -e "\"$COMMIT_MSG\""

# Confirm
read -p "Use this message? [s/N]: " CONFIRM
if [[ "$CONFIRM" == "s" || "$CONFIRM" == "S" ]]; then
  git commit --amend -m "$COMMIT_MSG"
  echo "Commit updated"
else
  echo "Canceled"
fi
