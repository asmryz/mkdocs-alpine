import express from 'express';
import courseRoutes from './routes/courseRoutes.js';
const app = express();
const PORT = 4000;

app.use('/api', courseRoutes);

app.listen(PORT, () => {
  console.log(`Express server running at http://localhost:${PORT}`);
});