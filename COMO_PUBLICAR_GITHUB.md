# Como publicar no GitHub

O repositório Git já está inicializado e o primeiro commit foi feito.

## Próximos passos

### 1. Criar o repositório no GitHub

1. Acesse [github.com/new](https://github.com/new)
2. Nome sugerido: `painel-indicadores-render` (ou outro de sua preferência)
3. **Não** marque "Add a README", "Add .gitignore" ou "Choose a license" — o repositório deve começar vazio
4. Clique em **Create repository**

### 2. Conectar e enviar o código

No terminal, dentro da pasta do projeto, execute (substitua `SEU_USUARIO` e `painel-indicadores-render`):

```bash
git remote add origin https://github.com/SEU_USUARIO/painel-indicadores-render.git
git push -u origin main
```

**Exemplo:** Se seu usuário for `thaisfranco` e o repo for `painel-indicadores-render`:
```bash
git remote add origin https://github.com/thaisfranco/painel-indicadores-render.git
git push -u origin main
```

### 3. Deploy no Render

1. Acesse [render.com](https://render.com) e faça login
2. Clique em **New** → **Blueprint**
3. Conecte o repositório que você acabou de criar
4. Configure as variáveis **EMAIL** e **TOKEN** em Environment
5. Clique em **Apply** para iniciar o deploy
