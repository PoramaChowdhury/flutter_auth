# 🔐 Flutter Firebase Auth App (Flutter 3.35.2)

A full Flutter authentication app using Firebase with support for:
- ✅ Email & Password Sign In
- ✅ User Registration (Sign Up)
- ✅ Home Screen after login
- ✅ Firebase Initialization
- ✅ Cloud Firestore integration (optional)

> 🔧 Built with Flutter 3.35.2-stable and `firebase_auth` ^6.0.1

---

## 📱 Features

- Firebase Email/Password Authentication
- Sign In / Sign Up Forms
- Home Screen after successful authentication
- Error handling with Snackbars
- Shared preferences or session logic (optional)

---

## 🛠 Tech Stack

| Tool               | Version       |
|--------------------|---------------|
| Flutter SDK        | 3.35.2-stable |
| firebase_auth      | ^6.0.1        |
| firebase_core      | ^4.0.0        |
| cloud_firestore    | ^6.0.0        |
| shared_preferences | ^2.5.3        |

---

## 🚀 Firebase Setup

Make sure you’ve completed this before running the app:

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a project & register your Android app.
3. Download `google-services.json`
4. Place it in your project under:  
   `android/app/google-services.json`

---

## 🔧 Android Build Configuration

Add the following configurations to your Android build files:

### `android/app/build.gradle`

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.flutter_auth"
    compileSdk = 36
    ndkVersion =  "27.0.12077973"

    compileOptions {
        //need for notifications
        isCoreLibraryDesugaringEnabled = true

        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.auth"   //this name change with google json given one
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so flutter run --release works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}
dependencies {
    // For AGP 7.4+
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    // For AGP 7.3
    // coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:1.2.3")
    // For AGP 4.0 to 7.2
    // coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:1.1.9")
    implementation(platform("com.google.firebase:firebase-bom:34.1.0"))
    implementation("com.google.firebase:firebase-analytics")
}



flutter {
    source = "../.."
}

## `Project-level android/build.gradle`


buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.6.0")
    }
}
plugins {

    id("com.google.gms.google-services") version "4.4.3" apply false

}
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
