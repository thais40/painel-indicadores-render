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

## Atualização automática diária

Para atualizar os dados automaticamente em um horário fixo (ex.: todo dia às 8h):

1. **Configure REFRESH_TOKEN** no Render (Environment): crie um token secreto (ex.: `meu_token_123`).
2. Acesse [cron-job.org](https://cron-job.org) (gratuito) e crie um cron job:
   - **URL:** `https://SEU-PAINEL.onrender.com/?refresh=meu_token_123`
   - **Horário:** defina o horário desejado (ex.: 8:00 diariamente)
   - O serviço acordará o painel e limpará o cache; o próximo visitante verá dados atualizados.