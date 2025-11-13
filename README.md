# 🛒 Colt E-Commerce App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase&logoColor=black)
![Stripe](https://img.shields.io/badge/Stripe-008CDD?logo=stripe&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)

**A modern, feature-rich e-commerce mobile application built with Flutter**

Offering seamless shopping experiences with Firebase authentication, Stripe payment integration, and real-time product browsing.

[Features](#-features) • [Tech Stack](#️-tech-stack) • [Getting Started](#-getting-started) • [Architecture](#️-architecture) • [Screenshots](#-ui-screenshots)

</div>

---

## 📱 Project Overview

Colt E-Commerce App is a full-featured mobile shopping platform that demonstrates modern Flutter development practices. The app provides users with an intuitive interface to browse products, manage their shopping cart, track orders, and complete secure payments.

### 🎥 Video Demo

[![Colt E-Commerce App Demo](https://img.youtube.com/vi/6bmzUw-0dAc/maxresdefault.jpg)](https://www.youtube.com/watch?v=6bmzUw-0dAc&t=3s)

Watch the complete app walkthrough and feature demonstration on YouTube.

### Key Highlights

- 🔐 **Secure Authentication** with Firebase (Email/Password & Facebook Login)
- 💳 **Stripe Payment Integration** for seamless checkout
- 🌍 **Multilingual Support** (English & Arabic)
- 🌓 **Dark Mode** support with theme persistence
- 📦 **State Management** using BLoC/Cubit pattern
- 🔄 **Offline Caching** with SharedPreferences
- 📱 **Responsive Design** using ScreenUtil

---

## 🚀 Features

### Authentication & User Management

- ✅ Email/Password authentication
- ✅ Facebook OAuth integration
- ✅ Password recovery via email
- ✅ Password validation with visual feedback
- ✅ User profile management

### Shopping Experience

- ✅ Browse products by categories
- ✅ Product search and filtering
- ✅ Advanced filters (price range, category, title)
- ✅ Product details with image gallery
- ✅ Add to cart functionality
- ✅ Wishlist management with local persistence
- ✅ Real-time cart updates

### Checkout & Payments

- ✅ Shopping cart with quantity management
- ✅ Coupon code support
- ✅ Stripe payment gateway integration
- ✅ Order summary with shipping and tax calculation
- ✅ Payment success/failure handling

### UI/UX Features

- ✅ Beautiful product cards with cached images
- ✅ Smooth page transitions
- ✅ Loading states with custom animations
- ✅ Error handling with user-friendly messages
- ✅ Bottom navigation with persistent tabs
- ✅ Pull-to-refresh functionality

### Localization & Theme

- ✅ Full RTL (Right-to-Left) support for Arabic
- ✅ Dynamic language switching
- ✅ Light/Dark theme toggle
- ✅ Theme and language persistence

---

## 🛠️ Tech Stack

### Frontend Framework

- **Flutter** 3.9.2
- **Dart** 3.9.2

### State Management

- `flutter_bloc` ^9.1.1 - BLoC pattern implementation
- `get_it` ^8.0.3 - Dependency injection

### Backend & Services

- **Firebase Core** ^4.0.0
- **Firebase Auth** ^6.1.1 - User authentication
- `dio` ^5.9.0 - HTTP client
- `retrofit` ^4.6.0 - Type-safe API calls

### Payment Processing

- `flutter_stripe` ^12.1.0 - Stripe SDK integration

### Local Storage

- `shared_preferences` ^2.5.3 - Key-value storage
- `flutter_cache_manager` ^3.4.1 - Image caching

### UI Components

- `flutter_svg` ^2.2.1 - SVG rendering
- `flutter_screenutil` ^5.9.3 - Responsive design
- `cached_network_image` ^3.4.1 - Optimized image loading
- `shimmer` ^3.0.0 - Loading placeholders

### Localization

- `easy_localization` ^3.0.7
- `intl` ^0.20.2
- `flutter_localizations` - Material & Cupertino localizations

### Code Generation

- `freezed` ^3.2.0 - Immutable models
- `json_serializable` ^6.11.1 - JSON serialization
- `build_runner` ^2.6.0 - Code generation

### Social Login

- `flutter_facebook_auth` ^7.1.2

### Developer Tools

- `device_preview` ^1.3.1 - Multi-device testing
- `pretty_dio_logger` ^1.4.0 - Network request logging

---

## 🏗️ Architecture

The app follows **Clean Architecture** principles with a clear separation of concerns:

```
lib/
├── core/                          # Core utilities and configurations
│   ├── config/                    # App configuration
│   │   ├── app_config.dart
│   │   ├── firebase_options.dart
│   │   └── firebase_setup.dart
│   ├── connection/                # Network connectivity
│   ├── constants/                 # App-wide constants
│   ├── di/                        # Dependency injection setup
│   ├── errors/                    # Error handling
│   │   ├── api_error_handler.dart
│   │   └── firebase_error_handler.dart
│   ├── generated/l10n/            # Localization files
│   ├── helpers/                   # Utility functions
│   ├── networking/                # Network layer
│   │   ├── api/                   # REST API configuration
│   │   ├── cache/                 # Caching mechanism
│   │   ├── firebase/              # Firebase services
│   │   └── stripe_service/        # Payment integration
│   ├── routing/                   # Navigation setup
│   ├── theme/                     # Theme configuration
│   └── widgets/                   # Reusable widgets
│
├── features/                      # Feature modules
│   ├── auth/                      # Authentication
│   │   ├── presentation/
│   │   │   ├── cubit/            # State management
│   │   │   ├── screens/          # UI screens
│   │   │   └── widgets/          # Feature widgets
│   │
│   ├── home/                      # Home screen
│   ├── products/                  # Product management
│   │   ├── data/
│   │   │   ├── model/            # Data models
│   │   │   └── repo/             # Repository layer
│   │   └── presentation/
│   │
│   ├── categories/                # Category browsing
│   ├── cart/                      # Shopping cart
│   ├── wishlist/                  # Favorites
│   ├── checkout/                  # Payment flow
│   ├── profile/                   # User profile
│   └── support/                   # Customer support
│
├── app.dart                       # App initialization
└── main.dart                      # Entry point
```

### Design Patterns Used

- **BLoC Pattern** for state management
- **Repository Pattern** for data access
- **Dependency Injection** with GetIt
- **Factory Pattern** for API client creation
- **Observer Pattern** for route tracking

### Folder Structure

#### Core Layer
Contains app-wide utilities, configurations, and shared components:

- `config/` - Firebase, app settings
- `networking/` - API services, caching, Stripe
- `theme/` - Light/dark themes with cubit
- `routing/` - Navigation setup with observers
- `di/` - Dependency injection configuration

#### Feature Layer
Each feature follows a modular structure:

```
feature/
├── data/
│   ├── model/       # Data models with JSON serialization
│   └── repo/        # Repository implementations
└── presentation/
    ├── cubit/       # State management
    ├── screens/     # UI screens
    └── widgets/     # Feature-specific widgets
```

---

## 🎯 Getting Started

### Prerequisites

- Flutter SDK 3.9.2 or higher
- Dart SDK 3.9.2 or higher
- Android Studio / VS Code with Flutter extensions
- Firebase project setup
- Stripe account for payment testing

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/colt-ecommerce-app.git
cd colt-ecommerce-app
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Configure Firebase**

   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add Android/iOS apps to your Firebase project
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate directories
   - Run FlutterFire CLI to configure:

```bash
flutterfire configure
```

4. **Configure Facebook Login**

   - Create a Facebook App at [Facebook Developers](https://developers.facebook.com/)
   - Update `android/app/src/main/res/values/strings.xml` with your Facebook App ID and Client Token
   - Update `android/app/src/main/AndroidManifest.xml` with Facebook scheme

5. **Configure Stripe**

   - Get your Stripe keys from [Stripe Dashboard](https://dashboard.stripe.com/)
   - Update `lib/core/networking/stripe_service/api_keys.dart`:

```dart
static const String publishableKey = 'your_publishable_key';
static const String secretKey = 'your_secret_key';
```

6. **Generate code**

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

7. **Run the app**

```bash
flutter run
```

### Environment Setup

Create a `.env` file in the root directory (if needed for future environment variables):

```env
API_BASE_URL=https://api.escuelajs.co/api/v1/
```

---

## 🧪 Testing

The project is structured to support comprehensive testing:

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Generate coverage report
genhtml coverage/lcov.info -o coverage/html
```

### Test Structure

```
test/
├── unit/           # Unit tests for business logic
├── widget/         # Widget tests for UI components
└── integration/    # End-to-end integration tests
```

---

## 🎨 UI Screenshots

<div align="center">

### Authentication Flow
| Login | Register | Forgot Password |
|-------|----------|----------------|
| <img src="screenshots/login.png" width="250"/> | <img src="screenshots/register.png" width="250"/> | <img src="screenshots/forgot.png" width="250"/> |

### Shopping Experience
| Home | Products | Details |
|------|----------|---------|
| <img src="screenshots/home.png" width="250"/> | <img src="screenshots/products.png" width="250"/> | <img src="screenshots/details.png" width="250"/> |

### Cart & Checkout
| Cart | Checkout | Payment |
|------|----------|---------|
| <img src="screenshots/cart.png" width="250"/> | <img src="screenshots/checkout.png" width="250"/> | <img src="screenshots/payment.png" width="250"/> |

### Theme & Language
| Light Theme | Dark Theme | Arabic RTL |
|------------|-----------|------------|
| <img src="screenshots/light.png" width="250"/> | <img src="screenshots/dark.png" width="250"/> | <img src="screenshots/rtl.png" width="250"/> |

</div>

---

## 🔮 Future Improvements

### Planned Features

- [ ] Push notifications for order updates
- [ ] Advanced search with filters
- [ ] Product reviews and ratings
- [ ] Order tracking with real-time updates
- [ ] Multiple payment methods (PayPal, Apple Pay, Google Pay)
- [ ] Social sharing of products
- [ ] Discount codes and promotions
- [ ] Product recommendations using ML
- [ ] In-app chat support
- [ ] Wallet and loyalty points system

### Technical Enhancements

- [ ] Unit test coverage (target: 80%+)
- [ ] Integration tests for critical flows
- [ ] CI/CD pipeline with GitHub Actions
- [ ] Performance monitoring with Firebase Analytics
- [ ] Crash reporting with Firebase Crashlytics
- [ ] A/B testing for UI variations
- [ ] GraphQL API migration
- [ ] Microservices architecture for backend

---

## 📝 API Reference

The app uses the [FakeStore API](https://api.escuelajs.co/api/v1/) for demonstration purposes:

### Endpoints Used

```
GET    /categories           # Fetch all categories
GET    /products             # Fetch all products
GET    /products/:id         # Fetch single product
```

**Note:** For production, replace with your own backend API.

---

## 🔧 Configuration Files

### Firebase Configuration

- `firebase.json` - Firebase project configuration
- `android/app/google-services.json` - Android Firebase config
- `ios/Runner/GoogleService-Info.plist` - iOS Firebase config

### App Configuration

- `pubspec.yaml` - Dependencies and assets
- `analysis_options.yaml` - Dart analyzer rules
- `flutter_native_splash.yaml` - Splash screen configuration
- `flutter_launcher_icons.yaml` - App icon configuration

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Coding Standards

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Write meaningful commit messages
- Add comments for complex logic
- Ensure all tests pass before submitting PR

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Your Name**

- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [Your Name](https://linkedin.com/in/yourprofile)
- Twitter: [@yourhandle](https://twitter.com/yourhandle)
- Email: your.email@example.com

---

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev/) - UI framework
- [Firebase](https://firebase.google.com/) - Backend services
- [Stripe](https://stripe.com/) - Payment processing
- [FakeStore API](https://api.escuelajs.co/) - Demo API
- [Unsplash](https://unsplash.com/) - Product images

---

## 📞 Support

For support, email support@coltapp.com or join our Slack channel.

---

<div align="center">

**If you found this project helpful, please give it a ⭐!**

Made with ❤️ using Flutter

</div>
