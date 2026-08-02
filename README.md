# Islami Project

A Flutter mobile app that provides a clean Islamic experience with Quran browsing, Hadith cards, Sebha (Tasbih) counter, Radio UI, and a Time tab UI.

## Features

- Intro walkthrough using Introduction Screen
- Dashboard with bottom navigation tabs
  - Quran: sura list, search by name (EN/AR), “most recent” suras stored locally
  - Hadith: carousel of Hadith cards with a details screen
  - Sebha: digital tasbih counter with rotation animation and zikr cycling
  - Radio: radio list UI (play/volume buttons are currently UI-only)
  - Time: prayer-time style UI (currently static/demo content)

## Tech Stack

- Flutter + Dart (SDK constraint: `^3.10.4`)
- State management: Provider
- Local storage: Shared Preferences
- UI packages: carousel_slider, flutter_svg, google_fonts, introduction_screen
- Splash: flutter_native_splash

## Getting Started

### Requirements

- Flutter SDK installed
- Dart SDK (matches the Flutter channel you use)
- Android Studio / VS Code + Flutter/Dart plugins

### Install

```bash
flutter pub get
```

### Run

```bash
flutter run
```

### Build

```bash
flutter build apk
```

## Project Structure

Common entry points:

- `lib/main.dart`: app entry, routes, Provider setup
- `lib/ui/home/`: main screens and tabs (Quran / Hadith / Sebha / Radio / Time)
- `lib/widgets/`: reusable UI widgets (cards, list items, etc.)
- `lib/providers/`: app state (most recent suras)
- `lib/util/`: constants (colors, styles, routes)
- `assets/`: images + text assets (Quran/Hadith files, tab backgrounds, icons)

## Assets & Fonts

This project uses local assets declared in `pubspec.yaml`:

- Intro, tabs, icons, materials, sebha, time, quran, hadeeth assets
- Custom font: `Janna`

If assets don’t appear, run:

```bash
flutter clean
flutter pub get
```

## Screens

Routes are defined in `lib/main.dart` using `AppRoutes`:

- Intro Screen
- Dash Board
- Sura Details
- Hadith Details

## Notes

- Radio and Time tabs are currently UI-focused and can be connected later to real APIs/audio streams.
- “Most recent” suras are saved in Shared Preferences under the key `most_recent`.
