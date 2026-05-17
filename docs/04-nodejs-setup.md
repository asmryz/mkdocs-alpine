# 04. Node.js Setup Using NVM

Node.js is the runtime that allows us to run JavaScript on our computer instead of just inside a browser.

## 🎯 Learning Objectives
- Understanding NVM (Node Version Manager).
- Installing Node.js on Windows 11.
- Verifying the installation.

## 🤔 What is NVM?
**NVM** stands for Node Version Manager. It allows you to install multiple versions of Node.js and switch between them easily.

## 🛠️ Step-by-Step Installation (Windows 11)
1. Go to the [NVM for Windows GitHub](https://github.com/coreybutler/nvm-windows/releases).
2. Download **`nvm-setup.exe`**.
3. Run the installer and follow the instructions.
4. Open a **new** terminal (Command Prompt or PowerShell).

## 💻 Commands
Run these commands one by one:

### Check NVM version
```bash
nvm version
```

### See available Node versions
```bash
nvm list available
```

### Install the Long Term Support (LTS) version
```bash
nvm install lts
```

### Tell NVM to use the installed version
```bash
nvm use lts
```

### Verify installation
```bash
node -v
npm -v
```

## ❓ Why use NVM?
Professional developers often work on different projects that require different versions of Node.js. NVM makes this painless.

## ⚠️ Common Errors & Fixes
| Problem | Fix |
|---------|-----|
| `'nvm' is not recognized` | Restart your terminal or computer. |
| Access Denied | Run your terminal as **Administrator**. |
| `node -v` fails after install | Run `nvm use lts` first. |

---
**Summary**: You now have Node.js and NPM (Node Package Manager) installed! Now we can start building servers.
