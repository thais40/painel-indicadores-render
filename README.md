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

## Limitações no plano gratuito do Render

No **plano gratuito** o painel no Render:
- **TDS (Tech Support)** não é carregado (evita timeout); só INT, TINE e INTEL.
- Em **"Todos"** (ano e mês), são usados apenas os **últimos 12 meses**.
- O padrão ao abrir é **mês atual** para a primeira carga ser rápida.

Para ver **TDS** e **todos os meses** sem limites, rode o painel **localmente** (`streamlit run painel_jira_por_projeto_completo_CORRIGIDO_FINAL.py`).

---

## Plano pago no Render — o que muda

Se você assinar um **plano pago** no Render (serviço com instância paga, não só o workspace):

1. **Serviço sempre ligado**  
   No free tier o serviço “dorme” após ~15 min sem acesso e leva até 1 min para acordar. Em plano pago o serviço fica **sempre ativo**, sem esse atraso.

2. **Mais recursos por requisição**  
   Instâncias pagas (Starter, Standard, etc.) têm mais CPU/memória. Scripts pesados (muitas buscas no Jira) tendem a terminar mais rápido e com menos risco de o proxy encerrar a conexão.

3. **Sem “spin down”**  
   Não há desligamento por inatividade, então não há aquela primeira requisição lenta depois de um tempo sem uso.

4. **Custo**  
   O valor é **por serviço** (ex.: Starter ~US$ 7/mês, Standard ~US$ 25/mês). O workspace “Professional” (US$ 19/usuário/mês) é para times e recursos de equipe; para **aumentar tempo/recurso do seu app**, o que importa é **subir o tipo de instância do serviço** (Starter, Standard, etc.) no Dashboard do Render.

**Resumo:** com uma instância paga (ex.: Starter), o serviço não dorme e tem mais recurso; assim você pode reativar o carregamento do TDS e de “Todos” os meses no código e o painel tende a comportar-se como no local. O código hoje desliga TDS e limita “Todos” a 12 meses **só no plano gratuito** (quando detecta `PORT` do Render); num plano pago você pode remover ou relaxar essas limitações e testar.