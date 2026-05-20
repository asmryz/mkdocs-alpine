# 15. Final Project: Course Management Dashboard

Congratulations! You've reached the end of the workshop. Your final challenge is to review and run the complete **Course Management Dashboard** located in the `src/project/` folder.

This application integrates everything you have learned throughout this course: setting up a web server with **Express.js**, connecting to a serverless **Postgres Database (Neon)**, creating RESTful API endpoints, and building a responsive, reactive single-page frontend using **Alpine.js**.

## 📋 Project Requirements
The Course Management application incorporates the following features:  
1. **View List**: Displays a clean, tabular view of all courses directly fetched from the Neon database (`cid`, `code`, `title`, `crhr`, `semester`).   
2. **Retrieve Course Details**: Clicking a course's title dynamically retrieves the course record by ID (`cid`) using an API endpoint, and displays the details in the right-hand side panel.   
3. **Interactive Form Binding**: Uses Alpine.js two-way data-binding (`x-model`) to show the selected course's information inside an editable form.      
4. **Persist Updates**: Clicking the **Update** button sends a `POST` request containing the updated fields back to the server to perform an asynchronous `UPDATE` query on the PostgreSQL database, then automatically refreshes the course list.   
5. **Modern Stack & Clean Architecture**: Built with modern **ES Modules (ESM)** in Node.js, uses `@neondatabase/serverless` for SQL queries, and leverages Alpine's reactive lifecycle methods.    

## 📁 Project Structure
The project files are organized inside the `src/project/` folder as follows:

```text
project/
├── index.js             # Express server entry point
├── package.json         # Node.js manifest with ESM enabled and dependencies
├── public/
│   └── app.js           # Client-side JavaScript containing the Alpine.js App component
├── routes/
│   └── courseRoutes.js  # REST API endpoints for fetching and updating courses
├── utils/
│   └── db.js            # PostgreSQL database connection using @neondatabase/serverless
└── views/
    └── index.html       # Single Page Application frontend built with Alpine.js
```

## 🛠️ Codebase Implementation

Let's look at how the layers of the application are implemented.

### 1. Database Connection (`utils/db.js`)
We use `@neondatabase/serverless` to connect directly to our Neon PostgreSQL database instance via an encrypted connection string.

```javascript title="utils/db.js"
import { neon } from '@neondatabase/serverless';

export const SQL = neon('postgresql://neondb_owner:npg_J2pyu3cePaRq@ep-icy-heart-a5h7ggwf-pooler.us-east-2.aws.neon.tech/academic?sslmode=require&channel_binding=require');
```

### 2. Express Server Configuration (`index.js`)
The server serves static client files (under `/public`), parses incoming JSON requests, and maps all course-related endpoints to `/api`.

```javascript title="index.js"
import express from "express";
import courseRoutes from "./routes/courseRoutes.js";
import { dirname } from "path";
import { fileURLToPath } from "url";
import path from "path";
const app = express();
const PORT = 4000;

const __dirname = dirname(fileURLToPath(import.meta.url));
app.use(express.static(__dirname + "/public"));
app.use(express.json());
app.use("/api", courseRoutes);

app.get("/", (req, res) => res.sendFile(path.join(__dirname, "views", "index.html")));

app.listen(PORT, () => console.log(`Express server running at http://localhost:${PORT}`));
```

### 3. REST API Routes (`routes/courseRoutes.js`)
We define three main API endpoints for the client-side frontend to interact with:
* `GET /api/courses`: Fetches and lists all courses.
* `GET /api/courses/:cid`: Fetches detailed records of a specific course by its unique Course ID.
* `POST /api/courses`: Receives updated course details and saves them back to the database.

```javascript title="routes/courseRoutes.js"
import express from "express";
const router = express.Router();
const { SQL } = await import("../utils/db.js");

// Basic Route
router.get("/courses", async (req, res) => {
    // Fetch all rows from the courses table
    const courses = await SQL`SELECT * FROM course ORDER BY cid;`;
    res.status(200).json(courses);
});

router.get("/courses/:cid", async (req, res) => {
    const { cid } = req.params;
    const course = await SQL`SELECT * FROM course WHERE cid = ${cid};`;
    res.status(200).json(course[0]);
});

router.post("/courses", async (req, res) => {
    const { cid, code, title, crhr, semester } = req.body;
    if (cid) {
        const course = await SQL`UPDATE course SET code = ${code}, title = ${title}, crhr = ${crhr}, semester = ${semester} WHERE cid = ${cid} RETURNING *;`;
        res.status(200).json(course[0]);
    }
});

export default router;
```

### 4. Interactive Alpine.js Frontend Controller (`public/app.js`)
This script contains the `App` component that manages our state (`courses`, `selectedCourse`) and handles all backend network communication using the asynchronous `fetch()` API.

```javascript title="public/app.js"
function App() {
    return {
        courses: [],
        selectedCourse: {},
        async getCourses() {
            const response = await fetch("/api/courses").then(res => res.json());
            this.courses = response;
            console.log(this.courses);
        },
        async Edit(cid) {
            const response = await fetch(`/api/courses/${cid}`).then(res => res.json());
            this.selectedCourse = response;
            console.log(this.selectedCourse);
        },
        async Save() {
            const response = await fetch("/api/courses", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(this.selectedCourse),
            }).then(res => res.json());
            this.selectedCourse = {};
            await this.getCourses();
        }
    };
}
```

### 5. Single-Page Application Markup (`views/index.html`)
This is the reactive HTML template where we mount our Alpine.js component and map its reactivity to the UI elements using directives like `x-data`, `x-init`, `x-for`, `x-model`, and `@click`.

```html title="views/index.html"
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="//unpkg.com/alpinejs" defer></script>
    <script src="app.js"></script>
    <style>
        table {
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #808080;
            padding: 5px;
        }

        a:visited {
            color: blue;
        }
    </style>
    <title>Alpine JS</title>
</head>

<body x-data="App()" x-init="getCourses()">
    <h1>Alpine JS</h1>
    <div style="display: flex; gap: 20px;">
        <div>
            <h2>Courses</h2>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Code</th>
                    <th>Title</th>
                    <th>CrHr.</th>
                    <th>Semester</th>
                </tr>
                <tbody>
                    <template x-for="course in courses" :key="course.cid">
                        <tr>
                            <td x-text="course.cid"></td>
                            <td x-text="course.code"></td>
                            <td>
                                <a href="#" x-text="course.title" @click.prevent="Edit(course.cid)"></a>
                            </td>
                            <td x-text="course.crhr"></td>
                            <td x-text="course.semester"></td>
                        </tr>
                    </template>
                </tbody>
            </table>
        </div>
        <div x-show="Object.keys(selectedCourse).length !== 0">
            <h2>Course Details</h2>
            <form>
                <table>
                    <tr>
                        <th>Id : </th>
                        <td><input type="text" x-model="selectedCourse.cid" name="cid" readonly size="1"></td>
                    </tr>
                    <tr>
                        <th>Code : </th>
                        <td><input type="text" x-model="selectedCourse.code" name="code" size="5"></td>
                    </tr>
                    <tr>
                        <th>Title : </th>
                        <td><textarea x-model="selectedCourse.title" name="title" rows="2" cols="30"></textarea></td>
                    </tr>
                    <tr>
                        <th>CrHr : </th>
                        <td><input type="text" x-model="selectedCourse.crhr" name="crhr" size="3"></td>
                    </tr>
                    <tr>
                        <th>Semester : </th>
                        <td><input type="text" x-model="selectedCourse.semester" name="semester" size="3"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button type="button" @click="Save()">Update</button></td>
                    </tr>
                </table>
            </form>
            <pre x-text="JSON.stringify(selectedCourse, null, 2)"></pre>
        </div>
    </div>
</body>

</html>
```

## ⚙️ Running and Testing the App

### 1. Install Dependencies
Run the command below in the project directory (`src/project/`) to install Express, Dotenv, and Neon Database serverless libraries:

```sh title="Command Prompt"
npm install
```

### 2. Run in Development Mode
Start your Node.js server in watch mode:

```sh title="Command Prompt"
npm run dev
```

Your server will be running at [http://localhost:4000](http://localhost:4000).

## 🎓 Final Assignment Questions
1. How does `import.meta.url` assist Express in serving static HTML pages in ES Modules?
2. What are the key advantages of using Neon Serverless Postgres (`@neondatabase/serverless`) over standard PostgreSQL database packages when building full-stack server environments?
3. How does Alpine.js's two-way data binding (`x-model`) simplify state synchronization between our input fields and reactive JS data structures when saving/updating data via fetch?

---
**Summary**: Congratulations on completing the Full-Stack Database & Alpine.js Workshop! You are now fully equipped to build fast, reactive, and persistent modern web applications!
