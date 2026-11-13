# Tugas Minggu 3: Menyusun Layout dengan Widget Dasar Flutter

> Disalin dari foto layar LMS. Dipakai sebagai acuan coding.

## Informasi Tugas

| Item | Keterangan |
|---|---|
| Judul halaman di LMS | Membangun Form Input dan Pengelolaan State dengan GetX |
| Judul tugas | Tugas Minggu 3: Menyusun Layout dengan Widget Dasar Flutter |
| Status | Belum dikumpulkan |
| Pertemuan | 3 |
| Jenis penilaian | Rubrik analitik |
| Label di halaman | 5% nilai akhir |
| Mata kuliah | TI505 Pemrograman Mobile (3 SKS, Semester 5) |
| Sub-CPMK yang diukur | Sub-CPMK-1.1 Menyusun layout dengan widget dasar Flutter |
| Bobot tugas | 15% |

> Catatan: di halaman tertulis dua angka bobot yang berbeda (label "5% nilai akhir" dan "Bobot tugas: 15%"). Cek ulang di LMS bila perlu.

## Konteks

Aplikasi TabungKu membutuhkan layar utama yang rapi sebelum fitur formulir dan data dikembangkan. Pada tugas ini kamu menyusun tata letak (layout) layar **Ringkasan Tabungan** menggunakan widget dasar Flutter.

## Langkah Pengerjaan

1. Buat proyek Flutter baru dengan nama `tabungku_layout`.
2. Pada file `main.dart`, buat satu halaman bernama `RingkasanPage` dengan `Scaffold` dan `AppBar` yang berjudul "Ringkasan Tabungan".
3. Susun isi halaman dengan ketentuan berikut:
   - Satu kartu (`Card`) berisi nama tabungan, saldo, dan target, disusun dengan `Column` dan `Row`.
   - Satu baris (`Row`) berisi tiga tombol atau ikon ringkas sebagai penanda kategori (misalnya Menabung, Tarik, Riwayat).
   - Satu daftar sederhana berisi minimal tiga item transaksi, masing-masing menampilkan judul, tanggal, dan nominal.
4. Gunakan `Padding`, `Container`, `SizedBox`, dan properti `alignment`, `mainAxisAlignment`, atau `crossAxisAlignment` untuk mengatur jarak dan posisi elemen.
5. Pastikan tata letak tidak mengalami overflow pada layar ponsel potret dan layar tablet (gunakan emulator atau fitur *device preview*).
6. Dokumentasikan hasil dengan tangkapan layar pada dua ukuran layar berbeda.

## Ketentuan

- Gunakan hanya widget dasar Flutter yang diajarkan pada Pertemuan 1 dan 2. **Paket pihak ketiga tidak diperbolehkan.**
- Data transaksi boleh berupa data statis (*hard-coded*) di dalam kode.
- Kode harus dapat dijalankan tanpa galat (*error*) pada `flutter run`.
- Setiap bagian kode yang menyusun layout diberi komentar singkat.
- Pengerjaan bersifat individu. Kesamaan kode yang signifikan dengan pekerjaan lain menyebabkan nilai nol.

## Format Pengumpulan

Kumpulkan melalui LMS dalam bentuk **satu tautan repositori publik** (GitHub atau GitLab) yang memuat:

1. Kode sumber proyek Flutter.
2. Berkas `README.md` berisi nama, NIM, dan cara menjalankan aplikasi.
3. Dua tangkapan layar hasil pada ukuran layar berbeda, disimpan di folder `docs/`.

Tuliskan tautan repositori pada kolom teks pengumpulan, lalu klik **Kirim** sebelum tenggat.

**Yang dinilai:** Tautan repositori proyek Flutter (kode sumber, `README.md`, dan dua tangkapan layar pada ukuran layar berbeda) yang dikumpulkan melalui LMS.

## Rubrik Penilaian

### 1. Struktur hierarki layout (Sub-CPMK-1.1, bobot 40)

**Indikator:** Mahasiswa menyusun hierarki widget (Scaffold, Card, Column, Row, Padding, Container) secara tepat sesuai rancangan layar.

| Level | Nilai | Deskripsi |
|---|---|---|
| 4. Sangat baik | 100 | Seluruh hierarki widget tersusun tepat, setiap elemen berada pada induk yang sesuai, dan kode tersusun rapi dengan komentar yang menjelaskan tiap bagian layout. |
| 3. Baik | 80 | Hierarki widget tersusun tepat pada sebagian besar elemen dengan satu atau dua penempatan induk yang kurang sesuai. |
| 2. Cukup | 60 | Hierarki widget hanya sebagian yang benar sehingga beberapa elemen berada pada induk yang tidak sesuai dengan rancangan. |
| 1. Kurang | 40 | Hierarki widget tidak tersusun sesuai rancangan atau kode tidak dapat dijalankan karena struktur layout yang keliru. |

### 2. Penggunaan widget dan properti tampilan (Sub-CPMK-1.1, bobot 35)

**Indikator:** Mahasiswa memakai widget dasar Text, Image atau Icon, Card, dan Row dengan properti alignment, padding, dan jarak yang tepat.

| Level | Nilai | Deskripsi |
|---|---|---|
| 4. Sangat baik | 100 | Seluruh widget dasar digunakan dengan properti alignment, padding, dan jarak yang tepat sehingga tampilan terlihat rapi dan konsisten. |
| 3. Baik | 80 | Widget dasar digunakan dengan properti yang tepat pada sebagian besar elemen dan hanya ada satu elemen dengan jarak atau perataan yang kurang konsisten. |
| 2. Cukup | 60 | Penggunaan properti hanya sebagian tepat sehingga beberapa elemen tampak tidak sejajar atau jaraknya tidak merata. |
| 1. Kurang | 40 | Properti tampilan tidak digunakan atau digunakan secara keliru sehingga elemen tampak berantakan atau bertumpuk. |

### 3. Responsivitas tampilan pada variasi layar (Sub-CPMK-1.1, bobot 25)

**Indikator:** Mahasiswa memastikan tata letak tidak mengalami overflow pada dua ukuran layar dan membuktikannya dengan tangkapan layar.

| Level | Nilai | Deskripsi |
|---|---|---|
| 4. Sangat baik | 100 | Tata letak bebas overflow pada kedua ukuran layar dan tangkapan layar yang diserahkan menunjukkan hasil pada kedua ukuran tersebut dengan jelas. |
| 3. Baik | 80 | Tata letak bebas overflow pada salah satu ukuran layar atau tangkapan layar hanya menunjukkan sebagian hasil dengan jelas. |
| 2. Cukup | 60 | Terdapat overflow kecil pada salah satu ukuran layar dan tangkapan layar yang diserahkan tidak lengkap. |
| 1. Kurang | 40 | Terdapat overflow yang jelas pada layar yang diuji dan tidak ada tangkapan layar pembanding. |

## Checklist Coding

Diturunkan langsung dari soal di atas.

**Kode**

- [ ] Proyek Flutter bernama `tabungku_layout`
- [ ] `main.dart` berisi `RingkasanPage` dengan `Scaffold` dan `AppBar` berjudul "Ringkasan Tabungan"
- [ ] `Card` berisi nama tabungan, saldo, dan target (pakai `Column` dan `Row`)
- [ ] `Row` berisi 3 tombol/ikon kategori (Menabung, Tarik, Riwayat)
- [ ] Daftar minimal 3 transaksi, masing-masing dengan judul, tanggal, nominal (data statis)
- [ ] Memakai `Padding`, `Container`, `SizedBox`, serta `alignment` / `mainAxisAlignment` / `crossAxisAlignment`
- [ ] Hanya widget dasar dari Pertemuan 1 dan 2, tanpa paket pihak ketiga (termasuk tanpa GetX)
- [ ] Setiap bagian layout diberi komentar singkat
- [ ] `flutter run` berjalan tanpa error

**Pengujian**

- [ ] Tidak overflow di layar ponsel potret
- [ ] Tidak overflow di layar tablet

**Pengumpulan**

- [ ] `README.md` berisi nama, NIM, dan cara menjalankan aplikasi
- [ ] Dua tangkapan layar (ukuran berbeda) di folder `docs/`
- [ ] Repositori GitHub/GitLab berstatus publik
- [ ] Tautan repositori ditempel di kolom pengumpulan LMS dan klik **Kirim** sebelum tenggat
