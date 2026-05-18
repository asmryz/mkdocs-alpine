# 14. Alpine.js CRUD Application

Now we will build a frontend that uses our API! We will use **Alpine.js**, a lightweight frontend framework that works perfectly for small projects.

## 🎯 Learning Objectives
- Connecting Frontend to Backend using `fetch()`.
- Using Alpine.js for data binding and reactivity.
- Building a full CRUD (Create, Read, Update, Delete) UI.

## 🛠️ The Backend Setup
Ensure your Express server handles all CRUD methods:
```javascript
// routes/studentRoutes.js
router.put('/:id', (req, res) => { ... });
router.delete('/:id', (req, res) => { ... });
```

## 🏗️ The Frontend (index.html)
We link to Alpine.js via CDN:
```html
<!DOCTYPE html>
<html>
<head>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8">
    <div x-data="studentApp()" class="max-w-md mx-auto bg-white p-6 rounded shadow">
        <h1 class="text-2xl font-bold mb-4">Student Manager</h1>

        <!-- Add Form -->
        <div class="mb-4">
            <input x-model="newName" type="text" placeholder="Name" class="border p-2 w-full mb-2">
            <button @click="addStudent()" class="bg-blue-500 text-white p-2 w-full">Add Student</button>
        </div>

        <!-- List -->
        <ul>
            <template x-for="student in students" :key="student.id">
                <li class="flex justify-between items-center border-b py-2">
                    <span x-text="student.name"></span>
                    <button @click="deleteStudent(student.id)" class="text-red-500">Delete</button>
                </li>
            </template>
        </ul>
    </div>

    <script>
        function studentApp() {
            return {
                students: [],
                newName: '',
                async init() {
                    const res = await fetch('/students');
                    this.students = await res.json();
                },
                async addStudent() {
                    const res = await fetch('/students', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ name: this.newName })
                    });
                    const newStudent = await res.json();
                    this.students.push(newStudent);
                    this.newName = '';
                },
                async deleteStudent(id) {
                    await fetch(`/students/${id}`, { method: 'DELETE' });
                    this.students = this.students.filter(s => s.id !== id);
                }
            }
        }
    </script>
</body>
</html>
```

## 🔍 Key Alpine.js Directives
- `x-data`: Defines the component logic.
- `x-model`: Syncs an input field with a variable.
- `x-for`: Loops through an array to create elements.
- `@click`: Listens for a click event.
- `init()`: Runs automatically when the component loads.

## 🛠️ Step-by-Step
1. Create a `public/index.html` file with the code above.
2. In `server.js`, add `app.use(express.static('public'))` to serve this file.
3. Start your server and visit `http://localhost:3000`.

---
**Summary**: Alpine.js plus Express REST API is a powerful combination for building fast, modern web apps!
