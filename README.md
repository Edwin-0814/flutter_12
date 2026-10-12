# Experiment 12: Build Web App with Flutter

## Aim
To develop, execute, test responsiveness, and generate a production build for a Flutter Web application using `LayoutBuilder`.

---

## Step-by-Step Procedure

### Step 1: Check Flutter Web Environment
Verify that Flutter detects a supported web browser or web server target:
```bash
flutter devices
```
Expected output:
```text
Found 2 connected devices:
  Linux (desktop) • linux  • linux-x64      • Ubuntu 26.04.1 LTS
  Chrome (web)    • chrome • web-javascript • Google Chrome
```

### Step 2: Create Flutter Web Project
Initialize the Flutter web project:
```bash
flutter create flutter_web_app
cd flutter_web_app
code .
```

### Step 3: Run on Chrome
Launch the application on Google Chrome for interactive testing and hot reload:
```bash
flutter run -d chrome
```

### Step 4: Create Web Interface
Construct the baseline UI using `Scaffold`, `AppBar`, and `ElevatedButton`:
```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Flutter Web Application'),
  ),
  body: Center(
    child: ElevatedButton(
      onPressed: () {},
      child: const Text('Welcome'),
    ),
  ),
)
```

### Step 5: Implement Responsive Layout
Wrap the body with `LayoutBuilder` to dynamically adapt the UI based on constraints:
```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 600) {
      return const Text('Mobile Web Layout');
    }

    return const Text('Desktop Web Layout');
  },
)
```
- **Mobile Web Layout (< 600px)**: Compact single-column view optimized for handheld phone screens.
- **Desktop Web Layout (≥ 600px)**: Centered container card with extended padding, iconography, and larger action buttons suited for desktop monitors.

### Step 6: Test Browser Window Resizing
Resize the Chrome browser viewport:
- Dragging below **600px** triggers the **Mobile Web Layout**.
- Expanding above **600px** transitions smoothly into the **Desktop Web Layout**.

### Step 7: Create Production Web Build
Compile the Flutter web application to optimized static HTML, JavaScript, WebAssembly, and CSS assets:
```bash
flutter build web
```

### Step 8: Check Generated Files
The optimized distribution files are created inside `build/web/`:
```text
build/web/
├── index.html              # Web entry point
├── flutter_bootstrap.js    # Engine & service worker initialization
├── main.dart.js            # Compiled application JavaScript bundle
├── manifest.json           # Web App Manifest (PWA metadata)
├── favicon.png             # Site favicon
├── assets/                 # Fonts, icons, and media assets
└── canvaskit/ / canvaskit.wasm (or SkWasm engine artifacts)
```

---

## Testing & Verification
Both layouts are automated via unit/widget tests:
```bash
flutter test
```
- `Renders Mobile Web Layout when screen width < 600` (Passed)
- `Renders Desktop Web Layout when screen width >= 600` (Passed)

---

## Expected Result
A responsive Flutter web application is successfully developed, executed, tested across breakpoints, and compiled into production-ready web artifacts under `build/web/`.
