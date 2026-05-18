# 06. Express.js Basics

Express is a fast, unopinionated, minimalist web framework for Node.js. It simplifies everything we learned in raw Node.js.

## 🎯 Learning Objectives
- Understanding the difference between raw Node.js and Express.
- Installing Express using NPM.
- Creating a basic "Hello World" server.

## 🚀 Why Express?
- **Raw Node**: You have to manually check `req.url` and `req.method`.
- **Express**: You use clean "routes" like `app.get()`, `app.post()`.

## 🛠️ Step-by-Step Setup
1. Create a new folder: `mkdir express-basics`.
2. Go inside: `cd express-basics`.
3. Initialize a project: `npm init -y`.
4. Install Express: `npm install express`.

## 💻 Building the Server


```javascript title="index.js"
import express from 'express';
const app = express();
const PORT = 3000;

// Basic Route
app.get('/', (req, res) => {
  res.send('Welcome to Express!');
});

// About Route
app.get('/about', (req, res) => {
  res.send('This is the about page.');
});

app.listen(PORT, () => {
  console.log(`Express server running at http://localhost:${PORT}`);
});
```

## 📋 Common Methods
- `app.get()`: Retrieve data (read).
- `app.post()`: Send new data (create).
- `app.put()`: Update existing data.
- `app.delete()`: Remove data.

## ❓ Practice Task
Add a new route `/contact` that returns your email address as plain text.

## ⚠️ Common Errors
- **`Module not found`**: You forgot to run `npm install express`.
- **`res.send` vs `res.end`**: In Express, always prefer `res.send()` or `res.json()` over `res.end()`.

---
**Summary**: Express.js is the most popular framework for building Node.js web applications!
