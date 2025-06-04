const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use(require('cors')());

// MongoDB Connection
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Connected to MongoDB Atlas'))
  .catch(err => console.error('MongoDB connection error:', err));

// Routes
app.get('/', (req, res) => {
  res.send('Hello from Azure DevOps & AKS!');
});

app.post('/api/data', async (req, res) => {
  try {
    const newData = { data: req.body.data };
    res.status(201).json({ message: 'Data received', data: newData });
  } catch (error) {
    res.status(500).send('Error processing data');
  }
});

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
