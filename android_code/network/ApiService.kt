package com.example.ovadrugx.network

import com.example.ovadrugx.models.*
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.POST

interface ApiService {

    @POST("register")
    fun registerUser(@Body request: RegisterRequest): Call<RegisterResponse>

    @POST("verify")
    fun verifyUser(@Body request: VerifyRequest): Call<GenericResponse>

    @POST("login")
    fun loginUser(@Body request: LoginRequest): Call<LoginResponse>

    @POST("forgot-password")
    fun forgotPassword(@Body request: ForgotPasswordRequest): Call<ForgotPasswordResponse>

    @POST("verify-reset-otp")
    fun verifyResetOtp(@Body request: VerifyRequest): Call<GenericResponse>

    @POST("reset-password")
    fun resetPassword(@Body request: ResetPasswordRequest): Call<GenericResponse>

    @POST("predict")
    fun predict(@Body request: PredictRequest): Call<PredictResponse>
}
