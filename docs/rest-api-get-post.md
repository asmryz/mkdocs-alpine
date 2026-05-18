# 12. REST API Basics

A REST API allows different applications to talk to each other using JSON.

## 🎯 Learning Objectives
- Understanding REST principles.
- Implementing HTTP Methods: GET and POST.
- Working with URL parameters and Request Body.

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
