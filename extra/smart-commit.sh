#!/bin/bash

# Cargar API Key
source .env

# Obtener diff del último commit
DIFF=$(git diff HEAD^..HEAD)

# Validar si hay diff
if [ -z "$DIFF" ]; then
  echo "❌ No hay cambios para analizar."
  exit 1
fi

# Prompt del sistema + diff
PROMPT=$(cat <<EOF
Quiero que seas un generador de mensajes de commit. 
Tu tarea es analizar el siguiente diff y devolver un mensaje de commit corto y claro en español, siguiendo buenas prácticas (en imperativo y sin punto final). 
No uses palabras genéricas como "cambios", "ajustes", etc. Sé específico y claro.

Aquí está el diff:
$DIFF
EOF
)

# Llamada a la API de OpenAI
RESPONSE=$(curl -s https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4",
    "messages": [
      {"role": "system", "content": "Sos un generador de mensajes de commit útiles y profesionales"},
      {"role": "user", "content": "'"${PROMPT}"'"}
    ],
    "temperature": 0.4
  }')

# Extraer respuesta
COMMIT_MSG=$(echo "$RESPONSE" | jq -r '.choices[0].message.content' | head -n 1)

# Mostrar resultado
echo -e "\n💬 Sugerencia de commit:"
echo -e "\"$COMMIT_MSG\""

# Confirmar y aplicar
read -p "¿Usar este mensaje? [s/N]: " CONFIRM

if [[ "$CONFIRM" == "s" || "$CONFIRM" == "S" ]]; then
  git commit --amend -m "$COMMIT_MSG"
  echo "✅ Commit actualizado"
else
  echo "❌ Cancelado"
fi
