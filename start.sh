#!/usr/bin/env bash
# Corrige conflito quando PORT/STREAMLIT_SERVER_PORT está com valor inválido (ex: token no lugar da porta)
unset STREAMLIT_SERVER_PORT
if [[ "$PORT" =~ ^[0-9]+$ ]]; then
  USE_PORT=$PORT
else
  USE_PORT=10000
fi
exec python -m streamlit run painel_jira_por_projeto_completo_CORRIGIDO_FINAL.py --server.port=$USE_PORT --server.address=0.0.0.0 --server.headless=true
