FROM cirrusci/flutter:latest

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./

RUN flutter pub get

COPY . .

RUN apt update && apt install -y openjdk-8-jdk android-sdk-platform-tools android-sdk-build-tools

RUN sdkmanager --licenses

RUN flutter build apk