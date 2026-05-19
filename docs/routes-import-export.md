# 10. Routes, Import and Export

As your application grows, putting everything in one file makes it messy. We need to split our code into modules.

## 🎯 Learning Objectives
- Understanding Modularisation.
- Using `export` and `import`.
- Using Express Router.

## 📁 Recommended Structure
```text
project/
├── node_modules/
├── index.js
├── package.lock.json
├── package.json
└── utils/
```

## Create Routes Folder

Create `routes/courseRoutes.js` file

```text hl_lines="3 4"
project/
├── node_modules/
├── routes/
│   └── courseRoutes.js
├── index.js
├── package.lock.json
├── package.json
└── utils/
```
```javascript title="courseRoutes.js"
import express from 'express';
const router = express.Router();


export default router;
```
move `Basic  Route` from `index.js` to `courseRoutes.js`. Change the name of `app` object to `router` and `/` root toute to `/courses`

```javascript title="index.js" hl_lines="1-4" linenums="5"
// Basic Route
app.get('/', (req, res) => {
  res.send('Welcome to Express!');
});
```

```javascript title="courseRoutes.js" hl_lines="4-7"
import express from 'express';
const router = express.Router();

// Basic Route
router.get('/courses', (req, res) => {
  res.send('Welcome to Express!');
});

export default router;
```
## 🛠️ Plugging it into the main Server
Update `index.js`: `app.use('/api', courseRoutes)` mounts middleware so requests starting with `/api` are handled by `courseRoutes`.

```javascript title="index.js" hl_lines="2 6"
import express from 'express';
import courseRoutes from './routes/courseRoutes.js';
const app = express();
const PORT = 4000;

app.use('/api', courseRoutes);

app.listen(PORT, () => {
  console.log(`Express server running at http://localhost:${PORT}`);
});
```

Now navigate to [http://localhost:4000/api/courses](http://localhost:4000/api/courses).

Why this URL works:
- `/api` comes from `app.use('/api', courseRoutes)`, which adds a base prefix for all routes in `courseRoutes`.
- `/courses` comes from the route path defined in `courseRoutes` (for example, `router.get('/courses', ...)`).
- Express combines them into one path, so the request reaches the same basic route handler at `/api/courses`.


## What is `express.Router()`?

In Express.js, `express.Router()` is a mini routing system that lets you organize routes into separate modules instead of putting everything in one big file.


Normally, you define routes directly on the Express app:


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

As your project grows, this becomes messy.

`express.Router()` creates a **modular router object** where you can group related routes together.

---

## Why do we separate routes?

### 1. Better Organization

Instead of:

```txt
index.js
  500 routes
```

you can have:

```txt
routes/
  courseRoutes.js
  authRoutes.js 
```

Each file handles one feature.

---

### 2. Easier Maintenance

If something breaks in course routes:

```txt
routes/courseRoutes.js
```

You know exactly where to look.

---

### 3. Cleaner Code

Without routers:

```js
app.get(...)
app.post(...)
app.put(...)
app.delete(...)
```

for every feature in one file becomes huge and unreadable.

Routers keep files small and focused.

---

### 4. Reusability

You can mount routers anywhere:

```js
app.use('/api/courses', courseRoutes);
app.use('/admin/users', adminUserRoutes);
```

---

### 5. Middleware Control

You can apply middleware only to specific routes.

```js
router.use(authMiddleware);
```

Now every route in that router is protected.

Example:

```js
router.get('/profile', ...);
router.get('/settings', ...);
```

---

### 6. Team Collaboration

In large projects:

* One developer works on auth routes
* Another on products
* Another on payments

No conflicts in one giant file.


## Simple Analogy

Think of `app.js` as a **main highway**.

`express.Router()` creates separate roads:

* `/courses`


Each road manages its own traffic.

---

## Summary

`express.Router()`:

* Creates modular route handlers
* Separates related routes
* Keeps code clean and scalable
* Makes maintenance easier
* Supports route-specific middleware
* Helps large teams work efficiently

It is one of the most important concepts in building scalable Express applications.



## 📋 Key Syntax
- `export default x`: Makes `x` available for other files.
- `import x from './path.js'`: Imports a default export from another file.
- `express.Router()`: Creates a mini-app for specific routes.

## ❓ Practice Task
Create a `utils/teachers.js` file and a corresponding `routes/teacherRoutes.js`. Connect them to your main `index.js`.

---
**Summary**: Splitting code into files makes it maintainable and organized!
