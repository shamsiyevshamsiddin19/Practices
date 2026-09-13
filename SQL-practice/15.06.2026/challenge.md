Qoyil! Unda haqiqiy jangni boshlaymiz. O'rgangan `INNER JOIN` bilimingizni Padel arenasi tizimida sinab ko'ramiz.

Tasavvur qiling, bizda quyidagi ikkita jadval bor (ular allaqachon yaratilgan va ichida ma'lumotlar bor deb hisoblaymiz):

**1. `players` jadvali:**

* `id` (Asosiy kalit)
* `name` (O'yinchining ismi, masalan: 'Doston', 'Shamsiddin')
* `phone` (Telefon raqami)

**2. `bookings` jadvali:**

* `id` (Asosiy kalit)
* `player_id` (`players` jadvalidagi `id` ga bog'langan)
* `court_type` (Kort turi: 'Indoor' yoki 'Outdoor')
* `price` (To'lov summasi, masalan: 450000)

---

### 🎯 CHALLENGE: "Kassa hisoboti"

Admin sizdan quyidagi ma'lumotlarni chiqarib beruvchi SQL so'rovini yozishni so'radi.

**Talablar:**

1. Ikkala jadvalni **`INNER JOIN`** yordamida birlashtiring.
2. Natijada faqat 3 ta ustun ko'rinsin:
* O'yinchining ismi (`name` ustuni) -> **"Mijoz"** nomi bilan (Alias).
* Kort turi (`court_type` ustuni) -> **"Kort"** nomi bilan.
* To'lov summasi (`price` ustuni) -> **"Summa"** nomi bilan.


3. Natijani filtrlash kerak (`WHERE`): Faqat **'Indoor'** (yopiq) kortlarni band qilgan o'yinchilar ro'yxati chiqsin.

*Yordam: `SELECT` qismida ikkala jadvaldagi ustunlarni chaqirayotganda, ular qaysi jadvalga tegishli ekanligini ko'rsatish tavsiya qilinadi (masalan: `players.name`).*

Qani, qanday SQL kod yozgan bo'lardingiz? Bitta urunishda xatosiz yozishga harakat qilib ko'ring! 🚀
