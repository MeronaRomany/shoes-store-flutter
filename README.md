# Shoes Store App (E-Commerce)

A cross-platform Flutter e-commerce app for shoes. Products are loaded from a REST API, with Firebase authentication, a shopping cart, and a Light/Dark theme.

Screenshots
<table> <tr> <td align="center"><b>[Screen 1 name]</b></td> <td align="center"><b>[Screen 2 name]</b></td> <td align="center"><b>[Screen 3 name]</b></td> </tr> <tr> <td><img src="doc/shotscreens/photo_2026-05-18_13-35-19.jpg" width="220"></td> <td><img src="doc/shotscreens/photo_2026-05-18_13-35-25.jpg" width="220"></td> <td><img src="doc/shotscreens/photo_2026-09-25_00-07-16.jpg" width="220"></td> </tr> <tr> <td align="center"><b>[Screen 4 name]</b></td> <td align="center"><b>[Screen 5 name]</b></td> <td></td> </tr> <tr> <td><img src="doc/shotscreens/photo_2026-09-25_00-07-54.jpg" width="220"></td> <td><img src="doc/shotscreens/photo_2026-09-25_00-08-01.jpg" width="220"></td> <td></td> </tr> </table>
## Features

- Onboarding screens shown only on the first launch
- Sign up and sign in with Firebase Authentication
- Product listings fetched from a RESTful API
- Browse by brand and "See All" products
- Shopping cart
- Responsive UI with Light and Dark themes (the selected theme is saved)

## Tech Stack

| Category | Tools |
|----------|-------|
| Framework | Flutter, Dart |
| State Management | BLoC / Cubit, HydratedCubit |
| Networking | Dio, REST API |
| Backend | Firebase Authentication, Cloud Firestore |
| Local Storage | Shared Preferences (onboarding flag), HydratedBloc storage (theme) |
| Version Control | Git, GitHub |

## State Management

The app uses separate Cubits for each concern:

- `ProductsCubit`: loads products from the API
- `CubitCartProduct`: manages the cart
- `BrandsCubit`: manages brands on the home page
- `SeeAllProduct`: controls the "See All" view
- `ThemeCubit`: Light/Dark theme, persisted with HydratedCubit

## Getting Started

### Prerequisites

- Flutter SDK installed ([installation guide](https://docs.flutter.dev/get-started/install))
- A Firebase project (Android app registered)

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/MeronaRomany/shoes-store-flutter.git
   cd shoes-store-flutter
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Add your Firebase configuration (`google-services.json`).
4. Run the app:
   ```bash
   flutter run
   ```

## Author

**Merona Romany Khalil** | [LinkedIn](https://linkedin.com/in/merona-romany-khalil-62b191362) | [GitHub](https://github.com/MeronaRomany)
