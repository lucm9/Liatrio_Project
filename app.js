const express = require('express');
const app = express();

app.get('/', (req, res) => {
  const timestamp = Math.floor(Date.now() / 1000);
  const message = 'Automate all the things!';
  res.json({ message, timestamp });
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
