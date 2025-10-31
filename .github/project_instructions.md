# 🧭 Copilot Instructions – Flutter Health Connect Sleep Tracker

## 🧱 Architecture
Use **Clean Architecture** with **BLoC (Cubit)** and **Repository Pattern**.

- **Layers**:  
  - `presentation`: UI, Cubit (state management)  
  - `domain`: entities, use cases, repository contracts  
  - `data`: models, repository implementations, data sources  
- **Dependency Injection**: handled via `get_it`  
- **Immutability**: use `freezed` for state & entities  
- **One Responsibility per Class**  
- **No dynamic types**, explicit typing everywhere  

---

## 🗂️ Directory Structure
```
lib/
│
├── core/                     # Shared utilities, constants, DI setup
│   ├── constants/
│   ├── errors/
│   ├── utils/
│   └── di/service_locator.dart
│
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
│
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
├── presentation/
│   ├── cubit/
│   ├── screens/
│   ├── widgets/
│   └── app.dart
│
└── main.dart
```

---

## 💡 Naming Rules
- **Classes** → `PascalCase`  
- **Variables / Functions** → `camelCase`  
- **Files & Folders** → `snake_case`  
- **Booleans** → use prefixes (`isConnected`, `hasPermission`)  
- **Constants** → `kConstantName` or full words in caps  
- Use complete words (avoid abbreviations)  

---

## 🧠 Coding Rules
- Each function < 20 lines, one clear purpose  
- Use early returns (guard clauses)  
- Avoid deep nesting; extract helper methods  
- No logic inside UI widgets — move to Cubit or UseCase  
- Use `const` constructors whenever possible  

---

## ⚙️ Dependency Injection
`get_it` handles DI:
- Repositories → `singleton`  
- UseCases → `factory`  
- Cubits → `lazySingleton`  

Setup in `/core/di/service_locator.dart`

---

## 🧩 State Management
- Use `flutter_bloc` (Cubit)  
- Define UI state with `freezed`  
- All Cubits expose immutable state only  
- Business logic calls **UseCases** instead of repositories directly  

---

## 🛠️ Packages
- `flutter_bloc`
- `get_it`
- `freezed`
- `health`
- `url_launcher`

---

## 🧪 Testing
Follow **AAA (Arrange–Act–Assert)** pattern.  
Write tests for:
- Repositories  
- UseCases  
- Cubits  
Mock external dependencies (Health API).

---

## 📝 Commit Convention
Follow **Conventional Commits**:
```
feat(scope): short description
fix(scope): ...
chore(scope): ...
```
Examples:
- `feat(health): add sleep data fetch use case`
- `fix(ui): handle permission denied error`

---

✅ **Goal:**  
Keep code modular, type-safe, testable, and easy to navigate — following Clean Architecture, but written pragmatically for a small Flutter project.

---

### 💬 Notes for AI
- Always use explicit typing and small functions.  
- Prefer composition over inheritance.  
- Never put `async` logic inside `build()` methods.  
- Keep UI declarative and minimal; state drives all UI changes.  
- When unsure where logic belongs → **UseCase** first, not Cubit.  

---

### ✅ Output Style
- Code, comments, and docstrings must be in **English**.  
- Return complete, compilable Dart code — no placeholders or pseudo code.  

---

### 🔧 Optional Enhancements
- Add unit tests for `GetSleepData`, `RequestPermission`, and `CheckHealthConnectStatus` use cases.  
- Add `logger` util for debug prints.  
- Add localization later if needed.
