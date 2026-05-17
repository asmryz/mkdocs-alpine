# 13. Final Project: Student Management System

Congratulations! You've reached the end of the workshop. Your final challenge is to build a complete **Student Management System**.

## 📋 Project Requirements
Your application must include:
1. **View List**: See all students in a clean table or list.
2. **Add Student**: A form to add a new student (Name and Age).
3. **Delete Student**: A button to remove a student from the list.
4. **Edit Student**: (Challenge!) A button to edit an existing student name.
5. **Validation**: Prevent adding students with empty names.
6. **Alerts**: Show a success message when a student is added.

## 📁 Recommended Structure
```text
final-project/
├── server.js (Express server)
├── data.js (Initial data)
└── index.html (Alpine.js Frontend)
```

## 🛠️ Implementation Checklist
- [ ] Initialize NPM: `npm init -y` && `npm i express`
- [ ] Create `server.js` with GET, POST, PUT, DELETE.
- [ ] Enable `express.json()` and `express.static('public')`.
- [ ] Write `public/index.html` with Alpine.js logic.
- [ ] Test every feature using the browser.

## 💡 Troubleshooting Reference
- **CORS Error**: If your frontend and backend are on different ports, you might need the `cors` package.
- **Empty Response**: Make sure you called `res.json()` or `res.send()` in your routes.
- **Data not saving**: Remember that since we use a variable, data resets when you restart the server.

## 🎓 Final Assignment Questions
1. How do you pass data from an HTML input to your Express server?
2. What is the difference between `fetch` and `res.json`?
3. Why do we need `await` when calling `fetch()`?

---
**Summary**: You are now a Junior Full-Stack Developer! Keep building, keep coding, and most importantly, have fun!
