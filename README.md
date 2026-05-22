# RAGbot
A chatbot designed to consume data and provide access via RAG.

## Setup & Running

**Prerequisites:** Flutter >=3.0.0 (includes Dart). Install by adding the VS code extension for Flutter and then clicking download with the pop-up that says you're missing the SDK if you don't currently have Flutter installed. Then add Flutter to your path when prompted. Then restart VSCode. Otherwise, it might keep complaining that it can't find the path you've just added. 

```bash
cd front-end
flutter pub get
flutter run -d chrome --web-port 8080
flutter run -d chrome --release  # faster, but no hot reload
```

The app will be available at `http://localhost:8080`.
