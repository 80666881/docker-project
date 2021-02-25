// index.js
const Koa = require('koa');
const app = new Koa();

app.use(async ctx => {
   ctx.body = 'Hello docker1111';
});

app.listen(3008);