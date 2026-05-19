# 12. REST API Basics

A REST API allows different applications to talk to each other using JSON.

## 🎯 Learning Objectives
- Setup Project
- Understanding REST principles.
- Implementing HTTP Methods: GET and POST.
- Working with URL parameters and Request Body.

---
## Database Configuration 
1. In the [Neon Console](https://console.neon.tech), select your project on the **Dashboard**.
2. Click **Connect** on your **Project Dashboard** to open the **Connect to your database** modal.
3. Select **Create new database** from **Database** dropdown.
4. In **Database creation** give **Database name** `academic`. **Owner** should be `neodb_owner`. Click on **Create** button
5. Select **Connection string** from the connection string dropdown and copy the full connection string.
---
## Project Configuration
1. Install Neon serverless driver
```javascript title="Command Prompt"
npm install @neondatabase/serverless 
```
2. Create file `utils/db.js`
```javascript title="db.js"
import { neon } from '@neondatabase/serverless';

export const SQL = neon('postgresql://[user]:[password]@[neon_hostname]/[dbname]?sslmode=require&channel_binding=require');
```
3. Add the connection string as shown below
```txt 
postgresql://[user]:[password]@[neon_hostname]/[dbname]?sslmode=require&channel_binding=require
```
> Replace `[user]`, `[password]`, `[neon_hostname]`, and `[dbname]` with your actual database credentials.
4. Download `course.sql` file from [here](assests/courses.sql) an load it in your PostgreSQL Server in a database called `academic`
```text {.text .no-copy linenums="0"}
psql 'postgresql://[user]:[password]@[neon_hostname]/[dbname]?sslmode=require&channel_binding=require'

psql (18.1 (Ubuntu 18.1-1.pgdg24.04+2), server 17.8 (9c8634e))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, compression: off, ALPN: postgresql)
Type "help" for help.

academic=> \i courses.sql
CREATE TABLE
INSERT 0 40

```

```javascript title="courseRoutes.js" hl_lines="3 7-9"
import express from "express";
const router = express.Router();
const { SQL } = from "../utils/db.js";

// Basic Route
router.get("/courses", async (req, res) => {
    // Fetch all rows from the courses table
    const courses = await SQL`SELECT * FROM courses ORDER BY cid;`;    
    res.status(200).json(courses);
});

export default router;
```
5. Test your API in the browser [http://localhost:4000/api/courses](http://localhost:4000/api/courses).		


## 📡 What is a REST API?
It stands for **REpresentational State Transfer**. It's just a set of rules for building APIs that use standard HTTP methods.

## 🛠️ The Student API
Let's build a route to get a single student and add a new one.

### GET one student by ID
```javascript
// routes/studentRoutes.js
router.get('/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const student = students.find(s => s.id === id);
  
  if (!student) {
    return res.status(404).send('Student not found');
  }
  res.json(student);
});
```

### POST a new student
To handle incoming data, we need a "Body Parser" middleware.
```javascript
// server.js
app.use(express.json()); // Essential for POST requests!

// routes/studentRoutes.js
router.post('/', (req, res) => {
  const newStudent = {
    id: students.length + 1,
    name: req.body.name,
    age: req.body.age
  };
  students.push(newStudent);
  res.status(201).json(newStudent);
});
```

## 📋 Standard Status Codes
- `200 OK`: Successful GET/PUT.
- `201 Created`: Successful POST.
- `400 Bad Request`: User sent invalid data.
- `404 Not Found`: The resource doesn't exist.
- `500 Internal Server Error`: Something went wrong on the server.

## 🛠️ Step-by-Step
1. Add the `express.json()` middleware to `server.js`.
2. Add the GET and POST logic to your routes.
3. Test using your browser (for GET) or a specialized tool (for POST).

---
**Summary**: APIs are the bridge between your data (Database/Arrays) and the outside world!
