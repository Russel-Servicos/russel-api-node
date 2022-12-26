# API Russel Serviços

---

Esta API tem o objetivo de gerir alguns serviços internos da [Russel Serviços](https://russelservicos.com.br)

Até o momento a API apenas realiza o envio de e-mails quando um pedido é gerado no [pagar.me](https://pagar.me), ou quando um documento é criado [zapsign](https://zapsign.com.br/). Porém o principal objetivo é oferecer serviços para o gerenciamento de pedidos em um painel da empresa.


Nodejs 16.17.0



## Configurar

- `npm ci ` 
- coloque as credenciais no .env do banco de dados (host, user, ...), mailer (host, user, ...), emails para enviar (destino)
- `mysql://USERNAME:PASSWORD@HOST:PORTA/NOME_BANCO`. Exemplo: mysql://root:root@localhost:3306/russel_ecommerce
- `docker compose up` no diretório raiz.
- `npx prisma generate` pra atualizar a conexão com o banco de dados atualizado na variavel de ambiente em `.env`.
- quando for testar em ambiente de stage (site no ar, mas ainda em teste, antes de produção), use npm run stage ou troque o `MODE=production` de `npm start` para `MODE=stage`. Caso suba para produção, não esquece se configurar `npm start` para `MODE=production`.

## 

como testar com os mocks

como rodar os testes

ci/cd

como fazer deploy

- subir 
- `npm ci --production` para produção
- quando for testar em ambiente de stage (site no ar, mas ainda em teste, antes de produção), use npm run stage ou troque o `MODE=production` de `npm start` para `MODE=stage`. Caso suba para produção, não esquece se configurar `npm start` para `MODE=production`.