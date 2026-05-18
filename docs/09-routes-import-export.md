# 10. Routes, Import and Export

As your application grows, putting everything in one file makes it messy. We need to split our code into modules.

## 🎯 Learning Objectives
- Understanding Modularisation.
- Using `module.exports` and `require`.
- Using Express Router.

## 📁 Recommended Structure
```text
project/
├── server.js
├── routes/
│   └── studentRoutes.js
└── data/
    └── students.js
```

## 📦 Exporting Data
Create `data/students.js`:
```javascript
const students = [
  { id: 1, name: "Ali", age: 20 },
  { id: 2, name: "Maria", age: 22 }
];

module.exports = students;
```

## 🛣️ Creating Separate Routes
Create `routes/studentRoutes.js`:
```javascript
const express = require('express');
const router = express.Router();
const students = require('../data/students');

router.get('/', (req, res) => {
  res.json(students);
});

module.exports = router;
```

## 🛠️ Plugging it into the main Server
Update `server.js`:
```javascript
const express = require('express');
const app = express();
const studentRoutes = require('./routes/studentRoutes');

app.use('/students', studentRoutes);

app.listen(3000, () => console.log('Server running!'));
```

## 📋 Key Syntax
- `module.exports = x`: Makes `x` available for other files.
- `require('./path')`: Imports whatever was exported from that file.
- `express.Router()`: Creates a mini-app for specific routes.

## ❓ Practice Task
Create a `data/teachers.js` file and a corresponding `routes/teacherRoutes.js`. Connect them to your main `server.js`.

---
**Summary**: Splitting code into files makes it maintainable and organized!
