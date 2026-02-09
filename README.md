# painel_indicadores

Painel de Indicadores extraindo dados do Jira (Nuvemshop).

## Deploy no Render

1. Faça push do projeto para um repositório no GitHub
2. Acesse [render.com](https://render.com) e crie uma conta (ou faça login)
3. Clique em **New** → **Blueprint** e conecte o repositório
4. O Render detectará o `render.yaml` automaticamente
5. **Configure as variáveis de ambiente** no Dashboard:
   - **EMAIL**: seu e-mail do Jira/Atlassian
   - **TOKEN**: seu token de API do Atlassian ([gerar em id.atlassian.com](https://id.atlassian.com/manage-profile/security/api-tokens))
6. Clique em **Apply** para iniciar o deploy

Após o deploy, o painel ficará disponível em uma URL como `https://painel-indicadores-jira.onrender.com`

## Atualização automática diária (7h)

O painel é atualizado automaticamente todo dia às **7:00** (horário de Brasília) via GitHub Actions.

### Configuração

1. **Render:** adicione a variável `REFRESH_TOKEN` (crie um token secreto).
2. **GitHub:** em Settings → Secrets and variables → Actions, adicione:
   - `REFRESH_TOKEN` = mesmo valor do Render
   - `RENDER_PANEL_URL` = URL do painel (ex.: `https://painel-indicadores-jira.onrender.com`)

Veja detalhes em [CONFIGURAR_REFRESH_7H.md](CONFIGURAR_REFRESH_7H.md).

## Atualizar dados no Render (evitando 502)

- **Timeout no Render:** o proxy do Render permite requisições de até **100 minutos**. O que costuma causar 502 é o **WebSocket do Streamlit** fechar por inatividade (padrão ~30 s). Por isso o projeto usa `.streamlit/config.toml` com `websocketPingInterval = 900` (15 minutos), para manter a conexão viva durante atualizações longas.
- **Atualização por etapas:** o botão **"Atualizar dados"** atualiza um projeto por vez (TDS → INT → TINE → INTEL), com nova requisição a cada etapa, reduzindo ainda mais o risco de timeout.

**Em uma emergência:** clique em "Atualizar dados" e mantenha a aba aberta. Se ainda assim der 502 (por exemplo no TDS), rode o painel **localmente** e atualize aí.