#  Restoran Menyusi Ma'lumotlar Bazasi (SQL Amaliyoti)

Bu repozitoriy restoran menyusi uchun jadvallar yaratish, ma'lumot qo'shish va jadvallarni modifikatsiya qilish kabi asosiy SQL amaliyotlarini o'z ichiga oladi. 

Loyihada **DDL (Data Definition Language)** va **DML (Data Manipulation Language)** buyruqlaridan foydalanilgan.

##  Nimalar qilingan?
Ushbu SQL skripti (kod) quyidagi qadamlarni o'z ichiga oladi:

1. **Jadval yaratish (`CREATE TABLE`)**: `menu` nomli jadval yaratish (id, name, price, category, is_available, created_at ustunlari bilan).
2. **Cheklovlar qo'yish (`CHECK`, `DEFAULT`)**: Narxning manfiy bo'lmasligini tekshirish va ba'zi ustunlarga standart qiymatlar berish.
3. **Ma'lumot qo'shish (`INSERT INTO`)**: Jadvalga dastlabki taomlar va ichimliklarni kiritish.
4. **Jadval tuzilmasini o'zgartirish (`ALTER TABLE`)**:
   - Yangi ustunlar qo'shish (`spicy_level`, `calories`, `is_vegetarian`).
   - Ustunlarning ma'lumot turini o'zgartirish (`VARCHAR`, `BIGINT`, `INT`).
   - Jadval va ustun nomlarini o'zgartirish (`RENAME`).
5. **Nusxa olish (`BACKUP`)**: Mavjud jadvaldan to'liq nusxa ko'chirish.
6. **O'chirish amallari (`DROP`, `TRUNCATE`)**: Keraksiz ustunlarni va jadvallarni o'chirish hamda jadval ichidagi barcha ma'lumotlarni tozalash.

##  Qanday ishlatiladi?

1. Ushbu repozitoriyani yuklab oling yoki `menu.sql` faylidagi kodni nusxalang.
2. O'zingizning SQL muhitingizni oching (masalan, PostgreSQL (pgAdmin), MySQL yoki DBeaver).
3. Yangi so'rov (Query) oynasiga kodni tashlang va ishga tushiring (Run/Execute).
4. Har bir qadam (1 dan 10 gacha) mantiqiy ketma-ketlikda yozilgan, ularni birma-bir ishga tushirib natijani ko'rishingiz mumkin.

##  Texnologiyalar
- **Til:** SQL 
- **Ma'lumotlar bazasi:** PostgreSQL (kod sintaksisi asosan PostgreSQL uchun mo'ljallangan, lekin kichik o'zgarishlar bilan MySQL/SQL Server da ham ishlaydi).
