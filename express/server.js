const express = require('express');
const app = express();

// 基本測試路由
app.get('/', (req, res) => {
  res.send(`
    <h1>Welcome to KG_IPhunterShield!</h1>
    <p>This response is from Express (port 3000) proxied by Nginx (port 80).</p>
  `);
});

// 假設後續想加其他路由
app.get('/test', (req, res) => {
  res.json({ message: 'Hello from /test route!' });
});

// 請務必聽 port 3000，不要改成80
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Express server is running on port ${PORT}...`);
});
