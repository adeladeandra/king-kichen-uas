# King Chicken

Aplikasi Flutter untuk pemesanan makanan dan minuman di King Chicken Restaurant.

## Tentang Project

King Chicken adalah aplikasi mobile yang memungkinkan pengguna untuk:
- Melihat menu makanan, minuman, dan paket
- Menambahkan item ke keranjang belanja
- Melakukan pemesanan dan pembayaran
- Melihat promo yang tersedia

## Fitur

- 🍗 Menu ayam dengan berbagai varian
- 🍔 Menu burger dan makanan lainnya
- 🥤 Berbagai pilihan minuman
- 🛒 Keranjang belanja interaktif
- 💳 Sistem pembayaran dengan QR code
- 🎉 Halaman promo dan diskon
- 📱 Desain responsif dengan Material Design

## Cara Menjalankan Project

### Prasyarat

- Flutter SDK (versi 3.9.2 atau lebih tinggi)
- Dart SDK
- Android Studio / Xcode (untuk development mobile)
- Emulator atau device fisik

### Instalasi

1. Clone repository ini:
```bash
git clone <repository-url>
cd king_chicken
```

2. Install dependencies:
```bash
flutter pub get
```

3. Jalankan aplikasi:
```bash
flutter run
```

### Build untuk Produksi

**Android APK:**
```bash
flutter build apk
```

**iOS:**
```bash
flutter build ios
```

## Struktur Project

```
lib/
├── constants/          # Warna dan routes
├── models/            # Data models
├── screens/           # Halaman aplikasi
├── services/          # Business logic
├── widgets/           # Reusable widgets
└── main.dart          # Entry point
```

## Dependencies Utama

- `provider`: State management
- `carousel_slider`: Slider untuk gambar
- `qr_flutter`: Generate QR code

## Testing

Jalankan semua test:
```bash
flutter test
```

Jalankan test spesifik:
```bash
flutter test test/widget_test.dart
```

## Linting & Formatting

```bash
# Analisis kode
flutter analyze

# Format kode
dart format .
```

## Screenshots

Aplikasi ini memiliki desain yang telah dirancang di folder `base_design/` sebagai referensi UI/UX.
