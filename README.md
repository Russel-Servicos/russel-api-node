# API Russel Serviços

---

Esta API tem o objetivo de gerir alguns serviços internos da [Russel Serviços](https://russelservicos.com.br)

Até o momento a API apenas realiza o envio de e-mails quando um pedido é gerado no [pagar.me](https://pagar.me), ou quando um documento é criado [zapsign](https://zapsign.com.br/). Porém o principal objetivo é oferecer serviços para o gerenciamento de pedidos em um painel da empresa.

| Nome | Descrição |
| :-: | :-: |
| Hospedagem do backend Nodejs | [Render](https://dashboard.render.com/) |
| Servidor SMTP | Kinghost (empresa.russelservicos.com.br) |
| Banco de dados | Hostoo (ws1.russelservicos.com, banco russel_ecommerce) |

| Nome | Versão |
| :-: | :-: |
| Nodejs | 16.17.0 |

## Dicas sobre a ZapSign e a Hospedagem do backend

- [Logs do Webhook](https://app.zapsign.com.br/conta/configuracoes?tab=integration) - Caso de erro, os logs do webhook irão informar dos problemas.
- [Documentação](https://docs.zapsign.com.br/)
- ./logs - os logs do backend na hospedagem fica pasta logs. Qualquer requisição, eventos e erros serão descritos lá.
 
## Configurar

- `npm ci` para instalar as dependencias com a versão exata que está descrita no `package-lock.json`
- coloque as credenciais no `.env` do banco de dados (host, user, ...), mailer (host, user, ...), emails para enviar (destino).
- `mysql://USERNAME:PASSWORD@HOST:PORTA/NOME_BANCO`. Exemplo: `mysql://root:root@localhost:3306/russel_ecommerce`.
- Banco de dados
    - XAMPP (ou WAMP, ou LAMP): 
        - baixe e instale o xampp para usar o mysql.
        - inicie o mysqle o apache no xampp.
    - DOCKER: 
        - baixe e instale o docker.
        - `docker compose up` no diretório raiz para subir o banco de dados e o mailhog.
- `npx prisma generate` pra atualizar a conexão com o banco de dados atualizado na variavel de ambiente em `.env`.
- `npm run dev` para iniciar a aplicação.

## Como testar com os mocks

- `npm run dev`
- o mock da requisição está em `src/routes/__mocks__/mockRequestData.ts`na variável `docsCreated`. Coloque o valor no insomnia (ou similar) e faça o teste.

## Como fazer deploy

- acesse o [render](https://dashboard.render.com/)
- configure as variaveis de ambiente
- execute o deploy manual