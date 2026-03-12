package com.example.ovadrugx.models

import com.google.gson.annotations.SerializedName

// Generic Response for simple status/message
data class GenericResponse(
    @SerializedName("status") val status: String?,
    @SerializedName("message") val message: String?,
    @SerializedName("error") val error: String? // Covers cases where 'error' is returned instead of 'message'
)

// ---------- AUTHENTICATION ----------

data class RegisterRequest(
    @SerializedName("full_name") val fullName: String,
    @SerializedName("email") val email: String,
    @SerializedName("mobile") val mobile: String,
    @SerializedName("password") val password: String
)

data class RegisterResponse(
    @SerializedName("message") val message: String?,
    @SerializedName("otp_demo") val otpDemo: String?, // For demo/testing purposes
    @SerializedName("error") val error: String?
)

data class LoginRequest(
    @SerializedName("email") val email: String,
    @SerializedName("password") val password: String
)

data class LoginResponse(
    @SerializedName("status") val status: String,
    @SerializedName("message") val message: String
)

data class VerifyRequest(
    @SerializedName("email") val email: String,
    @SerializedName("otp") val otp: String
)

// ---------- PASSWORD RESET ----------

data class ForgotPasswordRequest(
    @SerializedName("email") val email: String
)

data class ForgotPasswordResponse(
    @SerializedName("status") val status: String,
    @SerializedName("message") val message: String,
    @SerializedName("otp_demo") val otpDemo: String?
)

data class ResetPasswordRequest(
    @SerializedName("email") val email: String,
    @SerializedName("new_password") val newPassword: String
)

// ---------- PREDICTION ----------

data class PredictRequest(
    @SerializedName("Expression_Tumor") val expressionTumor: Double,
    @SerializedName("Expression_Normal") val expressionNormal: Double,
    @SerializedName("Fold_Change") val foldChange: Double,
    @SerializedName("Mutation_Frequency_%") val mutationFrequency: Double
)

data class PredictResponse(
    @SerializedName("status") val status: String,
    @SerializedName("prediction") val prediction: String?,
    @SerializedName("confidence") val confidence: Double?,
    @SerializedName("message") val message: String? // For error cases
)
