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