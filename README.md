# 🔐 Flutter Firebase Auth App (Flutter 3.35.2)

A full Flutter authentication app using Firebase with support for:
- ✅ Email & Password Sign In
- ✅ User Registration (Sign Up)
- ✅ Email verification 
- ✅ Home Screen after login
- ✅ Firebase Initialization

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

### `android/app/build.gradle.kts`
See the full configuration in [android/app/build.gradle.kts](android/app/build.gradle.kts).


### `Project-level android/build.gradle.kts`
See the full configuration in [android/build.gradle.kts](android/build.gradle.kts).

## 🔧Dependency Build Configuration

### `Configure the pubspec.yml`
See the full configuration in [pubspec.yaml](pubspec.yaml).

### 🔧 Auth Code  
See the full configuration in [/lib](/lib).

