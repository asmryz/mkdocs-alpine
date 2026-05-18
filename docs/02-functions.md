# 04. JavaScript Functions

Functions are blocks of code designed to perform a particular task. They are "called" when you need them.

## 🎯 Learning Objectives
- Understanding different ways to write functions.
- Difference between Classic, Anonymous, and Arrow functions.
- Understanding Implicit vs Explicit return.

## 🏗️ Classic Function
The traditional way using the `function` keyword.
```javascript
function add(a, b) {
  return a + b;
}
console.log(add(5, 3)); // Output: 8
```

## 🕵️ Anonymous Function
A function without a name, usually assigned to a variable.
```javascript
const add = function(a, b) {
  return a + b;
};
```

## 🏹 Arrow Function
The modern, shorter way.

### Standard Arrow
```javascript
const add = (a, b) => {
  return a + b;
};
```

### Instant (Implicit) Return
If the function is only one line, you can remove `{}` and `return`. This is called an **Implicit Return**.
```javascript
const add = (a, b) => a + b;
```

## ⚖️ Implicit vs Explicit Return
- **Explicit Return**: You use `{}` and the `return` keyword. Mandatory for multi-line functions.
- **Implicit Return**: No `{}` and no `return`. Only works for single-line expressions.

## 📋 Summary Table
| Type | Example |
|------|---------|
| **Classic** | `function name() { ... }` |
| **Arrow (Explicit)** | `const name = () => { return ... }` |
| **Arrow (Implicit)** | `const name = () => value` |

## 🛠️ Step-by-Step
1. Write a classic function that greets a user by name.
2. Convert it to an arrow function.
3. Call both to see if they produce the same result.

## ❓ Practice Task
Write an arrow function called `multiply` that takes two numbers and returns their product using an **implicit return**.

## ⚠️ Common Errors
- **Missing return**: If you use `{}` and forget to write `return`, the function returns `undefined`.
- **Unexpected token =>**: Check your syntax for the arrow function.

---
**Summary**: Functions help reuse code. Arrow functions are the modern standard for concise logic!
