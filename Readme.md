# 🧱 C++ Project Template for VS Code

A minimal, cross-platform C++ project template with VS Code integration — perfect for small projects or as a starting point for something bigger.

---

## ✅ Requirements

- **GCC toolchain**: `gcc`, `g++`, and `gdb` must be available in your system's `PATH`
- **VS Code Extensions**:  
  [C/C++ Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack)

---

## 🛠️ Build the Project

Build using the default task:

> **Windows / Linux / macOS**  
> Press `Ctrl + Shift + B` in VS Code

Or from the terminal:

```bash
make
```

---

## 🐞 Debug the Project

1. Set breakpoints in `main.cpp` or any file in `src/`
2. Start the debugger:

> Press `F5` in VS Code

This will compile the project and launch the `gdb` debugger with full variable watch, breakpoints, and stepping support.

---

## 🧹 Clean Build Artifacts

To remove compiled binaries and object files:

> In VS Code:  
> `Ctrl + Shift + P` → **Run Task** → `clean`

Or manually:

```bash
make clean
```

---

## 📁 Project Structure

```
project-root/
├── include/        # Header files (.h)
├── src/            # Source files (.cpp)
├── main.cpp        # Entry point
├── Makefile        # Platform-independent build
└── .vscode/
    ├── tasks.json  # VS Code build task
    └── launch.json # VS Code debug config
```

---

## 🔧 VS Code Configuration

### .vscode/tasks.json

<details>
<summary>Click to expand</summary>

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "build",
      "type": "shell",
      "command": "make",
      "args": [],
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "problemMatcher": ["$gcc"]
    },
    {
      "label": "clean",
      "type": "shell",
      "command": "make",
      "args": ["clean"],
      "group": "none"
    }
  ]
}
```

</details>

---

### .vscode/launch.json

<details>
<summary>Click to expand</summary>

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug main",
      "type": "cppdbg",
      "request": "launch",
      "program": "${workspaceFolder}/main",
      "args": [],
      "stopAtEntry": false,
      "cwd": "${workspaceFolder}",
      "environment": [],
      "externalConsole": false,
      "MIMode": "gdb",
      "miDebuggerPath": "gdb",
      "setupCommands": [
        {
          "description": "Enable pretty printing",
          "text": "-enable-pretty-printing",
          "ignoreFailures": true
        }
      ],
      "preLaunchTask": "build",
      "linux": {},
      "windows": {
        "program": "${workspaceFolder}/main.exe",
        "miDebuggerPath": "gdb.exe"
      }
    }
  ]
}
```

</details>

---

## 📄 Makefile

<details>
<summary>Click to expand</summary>

```makefile
CXX = g++
CXXFLAGS = -Wall -Wextra -g -Iinclude
SRC_DIR = src
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES = $(SRC_FILES:.cpp=.o)
TARGET = main

all: $(TARGET)

$(TARGET): main.cpp $(SRC_FILES)
	$(CXX) $(CXXFLAGS) main.cpp $(SRC_FILES) -o $(TARGET)

clean:
	rm -f $(TARGET) $(OBJ_FILES)
```

</details>

---

## 🚀 Features

- 🧩 Auto-detects source files
- 🏁 Cross-platform (Windows, Linux, macOS)
- 🔍 Full debugger support
- 📦 No hardcoded filenames — ready to reuse in future projects
