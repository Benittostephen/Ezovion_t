# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.BuildConfig { *; }
-keep class io.flutter.embedding.** { *; }
-keep class androidx.lifecycle.DefaultLifecycleObserver { *; }

# Flutter SDK
-keep class io.flutter.plugins.GeneratedPluginRegistrant { *; }

# Gson
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.google.gson.** { *; }
-keep class com.google.gson.stream.** { *; }

# OkHttp
-keepattributes Signature
-keepattributes Annotation
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# Retrofit
-keepattributes Signature
-keepattributes Exceptions
-keep class retrofit2.** { *; }
-keepclasseswithmembers class * {
    @retrofit2.http.* <methods>;
}

# Jackson
-keepattributes Signature
-keepattributes Annotation
-keep class com.fasterxml.jackson.** { *; }

# Other
-dontwarn com.google.gson.**
-dontwarn javax.annotation.**
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement