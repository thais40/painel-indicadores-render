# Configurar atualização automática às 7h

## 1. No Render (Dashboard)

Abra seu serviço → **Environment** e adicione:

| Variável       | Valor                    |
|----------------|--------------------------|
| REFRESH_TOKEN  | Crie um token secreto (ex.: `abc123xyz`) |

## 2. No GitHub (repositório painel-indicadores-render)

Vá em **Settings** → **Secrets and variables** → **Actions** e adicione:

| Secret             | Valor                                                                 |
|--------------------|-----------------------------------------------------------------------|
| REFRESH_TOKEN      | O **mesmo** token que você colocou no Render                         |
| RENDER_PANEL_URL   | URL do seu painel (ex.: `https://painel-indicadores-jira.onrender.com`) |

⚠️ **Importante:** O REFRESH_TOKEN deve ser idêntico no Render e no GitHub.

## 3. Pronto

O workflow `.github/workflows/refresh-panel.yml` roda automaticamente todo dia às **7:00** (horário de Brasília).

Para testar manualmente: **Actions** → **Atualizar Painel Diário** → **Run workflow**.
