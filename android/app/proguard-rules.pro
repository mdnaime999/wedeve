# Add your app specific options. Do not obfuscard the SDK

-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-keep class com.banuba.sdk.core.effects.** { *; }
-keep class com.banuba.sdk.effects.ve.speed.** { *; }

-keep class kotlinx.android.extensions.** { *; }

# The following rules are taken from generated "missing_rules.txt" file provided by R8
# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn com.google.devtools.build.android.desugar.runtime.ThrowableExtension
-dontwarn kotlinx.android.extensions.LayoutContainer
-dontwarn kotlinx.parcelize.Parcelize
-dontwarn org.bouncycastle.jsse.BCSSLParameters
-dontwarn org.bouncycastle.jsse.BCSSLSocket
-dontwarn org.bouncycastle.jsse.provider.BouncyCastleJsseProvider
-dontwarn org.conscrypt.Conscrypt$Version
-dontwarn org.conscrypt.Conscrypt
-dontwarn org.conscrypt.ConscryptHostnameVerifier
-dontwarn org.openjsse.javax.net.ssl.SSLParameters
-dontwarn org.openjsse.javax.net.ssl.SSLSocket
-dontwarn org.openjsse.net.ssl.OpenJSSE