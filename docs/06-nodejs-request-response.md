# 06. Request and Response in Node.js

Web communication is built on the **Request** and **Response** cycle.

## 🎯 Learning Objectives
- Understanding standard HTTP patterns.
- Building a simple server with the built-in `http` module.
- Working with `req` and `res` objects.

## 🔄 The Cycle
1. **Request (req)**: The message sent by the user (browser) to the server. Contains data like URL, headers, and method (GET/POST).
2. **Response (res)**: The message sent back by the server to the user. Contains status codes (200, 404) and the content (HTML/JSON).

## 🛠️ Building a Basic Server
Create a file named `server.js`:

```javascript
import http from 'http';

const server = http.createServer((req, res) => {
  console.log(`Request received: ${req.method} ${req.url}`);

  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello from Node.js server!");
});

const PORT = 3000;
server.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
```

## 🔍 Code Explanation
- `http.createServer()`: Initializes the server.
- `req`: Short for Request. We can use `req.url` to see what the user is asking for.
- `res`: Short for Response. We use `res.end()` to send the final message.
- `server.listen(3000)`: Tells the server to wait for requests on port 3000.

## 🛠️ Step-by-Step
1. Write the code above in `server.js`.
2. Open your terminal and run: `node server.js`.
3. Open your browser and go to `http://localhost:3000`.
4. Refresh the page and look at your terminal.

## ⚠️ Common Errors
| Error | Fix |
|-------|-----|
| `EADDRINUSE: address already in use :::3000` | Another server is using port 3000. Close it or change the port to 3001. |
| Browser says "Connection Refused" | Your server is likely not running. Run `node server.js`. |

---
**Summary**: Every web interaction is a request followed by a response. Node.js makes it easy to handle these!
