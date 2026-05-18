import express from 'express';
const app = express();
const PORT = 4000;

// Basic Route
app.get('/', (req, res) => {
  res.send('Welcome to Express!');
});

app.listen(PORT, () => {
  console.log(`Express server running at http://localhost:${PORT}`);
});