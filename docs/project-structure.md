# 09. Project Structure

In this section, you will learn how to scaffold a clean Node.js project from scratch — initialising it with npm, switching to ES Modules, installing Express, and organising your code into a structured directory before running a live-reload dev server.

## 🎯 Learning Objectives
- Create new Application in NodeJS
- Install Dependencies
- Test your Basic App

## 📁 Recommended Structure
```text
project/
├── node_modules/
├── index.js
├── package.lock.json
├── package.json
└── utils/
```

<!-- ```text
project/
├── index.js
├── routes/
│   └── courseRoutes.js
└── data/
    └── db.js
``` -->

## ✅ Check Node.js Installation
Before starting, make sure Node.js and npm are installed:

```sh title="Command Prompt"
node -v
npm -v
```

You should see version numbers. If not, refer to [04. Node.js Setup](nodejs-setup.md).

Create directory name `project`
```sh title="Command Prompt"
mkdir project
cd project
```

## 🚀 Initialized NodeJS application

```sh title="Command Prompt" 
npm init -y
```

```text hl_lines="2"
project/
└── package.json
```

```json title="package.json"
{
  "name": "project",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "type": "commonjs"
}
```
## 📝 Use ECMA Script
All latest development uses ESM (ECMA Scipt Module)

```json linenums="12" hl_lines="1" title="package.json"
  "type": "module"
```

## 📄 Create `index.js` (main) file

Create `index.js` file

```javascript title="index.js"
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
```
## ⚙️ Update dev Script
```json  linenums="6" hl_lines="3" title="package.json"
{
  "scripts": {
    "dev": "node --watch index.js"
  },
}
```
## 📦 Install ExpressJS dependencies
```sh title="Command Prompt"
npm install express
```
```json  linenums="13" hl_lines="2"
  "dependencies": {
    "express": "^5.2.1"
  }
```

## 🧪 Test your application
```sh title="Command Prompt"
npm run dev
```

```text { .text .no-copy linenums="0" }
npm run dev

> project@1.0.0 dev
> node --watch index.js

Express server running at http://localhost:4000
Completed running 'index.js'. Waiting for file changes before restarting...
```

## 📂 Directory Structure
```text
project/
├── node_modules/
├── index.js
├── package.lock.json
├── package.json
└── utils/
```


