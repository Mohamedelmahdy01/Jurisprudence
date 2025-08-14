// This file contains the main application logic for the Moassel Node.js application.

const express = require('express');
const mongoose = require('mongoose');
const { Client } = require('@opensearch-project/opensearch');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// MongoDB connection
mongoose.connect(process.env.MONGODB_URI, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log('MongoDB connected'))
    .catch(err => console.error('MongoDB connection error:', err));

// OpenSearch client
const client = new Client({
    node: `http://${process.env.OPENSEARCH_HOST}:${process.env.OPENSEARCH_PORT}`,
    auth: {
        username: process.env.OPENSEARCH_USER,
        password: process.env.OPENSEARCH_PASSWORD
    }
});

// Sample route
app.get('/', (req, res) => {
    res.send('Welcome to the Moassel application!');
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});