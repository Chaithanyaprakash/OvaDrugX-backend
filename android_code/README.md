# Android Network Layer Integration Guide

This directory contains the Kotlin files needed to connect your Android app to the Flask backend.

## 1. Add Dependencies
Add the following to your `app/build.gradle.kts` (Module-level):

```kotlin
dependencies {
    // Retrofit & Gson
    implementation("com.squareup.retrofit2:retrofit:2.9.0")
    implementation("com.squareup.retrofit2:converter-gson:2.9.0")
    implementation("com.squareup.okhttp3:logging-interceptor:4.9.0") 
    
    // ... other dependencies
}
```

## 2. Add Internet Permission
Open `src/main/AndroidManifest.xml` and add:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

If you are using `http` (not https), add this to the `<application>` tag:

```xml
android:usesCleartextTraffic="true"
```

## 3. Copy Files
Copy the `models` and `network` packages into your Android project's source folder (e.g., `app/src/main/java/com/example/ovadrugx/`).
**Note:** valid package names are required at the top of the files. Update `package com.example.ovadrugx...` if your package name is different.

## 4. Usage Examples

### Registration
```kotlin
val request = RegisterRequest("John Doe", "john@example.com", "1234567890", "password123")

RetrofitClient.instance.registerUser(request).enqueue(object : Callback<RegisterResponse> {
    override fun onResponse(call: Call<RegisterResponse>, response: Response<RegisterResponse>) {
        if (response.isSuccessful) {
            val otp = response.body()?.otpDemo
            // Use OTP to auto-fill or show user
        } else {
            // Handle error
        }
    }

    override fun onFailure(call: Call<RegisterResponse>, t: Throwable) {
        // Network error
    }
})
```

### Prediction
```kotlin
val request = PredictRequest(
    expressionTumor = 2.5,
    expressionNormal = 1.2,
    foldChange = 1.5,
    mutationFrequency = 12.5
)

RetrofitClient.instance.predict(request).enqueue(object : Callback<PredictResponse> {
    override fun onResponse(call: Call<PredictResponse>, response: Response<PredictResponse>) {
        if (response.isSuccessful && response.body()?.status == "success") {
            val prediction = response.body()?.prediction
            val confidence = response.body()?.confidence
            // Update UI
        }
    }

    override fun onFailure(call: Call<PredictResponse>, t: Throwable) {
        // Handle error
    }
})
```

## 5. Emulator vs Physical Device
- **Emulator**: Use `http://10.0.2.2:5000/` (Already configured in `RetrofitClient.kt`).
- **Physical Device**: Replace `BASE_URL` with your PC's IP address (e.g., `http://192.168.1.10:5000/`) and ensure both devices are on the same Wi-Fi.
