# 01. JavaScript Basics

JavaScript (JS) is the language of the web. It allows you to make web pages interactive and build powerful backends.

## 🎯 Learning Objectives
- Understanding where JS runs.
- Learning variables and data types.
- Debugging with `console.log()`.

## 💡 What is JavaScript?
JavaScript is a versatile programming language. Originally built for browsers, it now runs almost everywhere thanks to **Node.js**.

- **Browser**: JS manipulates the user interface (buttons, forms, animations).
- **Node.js**: JS runs on servers to handle databases and files.

## 📦 Variables
Variables are like containers for data.

### `let`, `const`, and `var`
- `const`: Used for values that **do not change** (constant).
- `let`: Used for values that **might change** (variable).
- `var`: The old way. **Avoid using it** in modern code.

### Examples
Create a file named `basics.js`:
```javascript
const name = "Ali";  // String
let age = 20;        // Number
const isStudent = true; // Boolean

console.log(name);
console.log(age);

age = 21; // This is allowed because of 'let'
console.log("New age:", age);
```

## 📋 Data Types
1. **String**: Text like `"Hello World"`.
2. **Number**: Integers or decimals like `10` or `3.14`.
3. **Boolean**: `true` or `false`.
4. **Array**: A list of data like `[1, 2, 3]`.
5. **Object**: A complex structure like `{ name: "Ali", age: 20 }`.

## 🛠️ Step-by-Step
1. Create a folder named `js-practice`.
2. Create `hello.js`.
3. Put `console.log("Hello Workshop!");` inside.
4. Run it in your terminal (if node is installed): `node hello.js`.

## ❓ Practice Task
Create a script that stores your favorite food in a `const` variable and your current mood in a `let` variable. Print both to the screen using `console.log()`.

## ⚠️ Common Errors
| Error | Fix |
|-------|-----|
| `ReferenceError: x is not defined` | Check if you spelled the variable name correctly. |
| `TypeError: Assignment to constant variable` | You tried to change a `const`. Use `let` instead. |

---
**Summary**: Variables help us store information. `const` is for static data, and `let` is for data that changes!
