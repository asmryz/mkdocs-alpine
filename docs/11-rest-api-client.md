# 11. REST API Clients

How do we test our API without building a whole website first? We use **API Clients**.

## 🎯 Learning Objectives
- Testing GET requests in the browser.
- Learning to use POST, PUT, and DELETE with tools like `curl` or VS Code extensions.

## 🛠️ Recommended Tools
1. **VS Code REST Client**: An extension for VS Code (highly recommended!).
2. **Thunder Client**: A GUI inside VS Code.
3. **Postman**: A powerful standalone application.
4. **curl**: A command line tool available on most systems.

## 💻 Using `curl` (Command Line)
`curl` is built into Windows 11 Terminal.

### GET all students
```bash
curl http://localhost:3000/students
```

### POST a student (with data)
```bash
curl -X POST http://localhost:3000/students \
-H "Content-Type: application/json" \
-d "{\"name\":\"Ahmed\",\"age\":20}"
```

## 📝 Using VS Code REST Client
Create a file named `test.http`:
```http
### Get students
GET http://localhost:3000/students

### Create student
POST http://localhost:3000/students
Content-Type: application/json

{
    "name": "Sarah",
    "age": 21
}
```
If you have the extension, you'll see a small "Send Request" button above the text!

## ❓ Why use these tools?
Browsers can only do standard **GET** requests easily. For **POST**, **PUT**, and **DELETE**, we need these clients to simulate how a frontend app would talk to our server.

---
**Summary**: API Clients allow you to test your backend independently before you start building the frontend!
