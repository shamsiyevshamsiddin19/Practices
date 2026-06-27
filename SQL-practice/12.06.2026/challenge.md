
BARCHA SQL VAZIFALARI QUYIDAGI JADVALLAR ASOSIDA:

  employees (xodimlar)
  ----------------------------------------------------------
  id           INTEGER   (primary key)
  name         TEXT
  department   TEXT      (masalan: 'IT', 'Sales', 'HR', 'Support')
  salary       INTEGER   (so'mda; NULL bo'lishi mumkin)
  city         TEXT      (masalan: 'Toshkent', 'Samarqand', 'Buxoro')
  hire_date    DATE      (ishga kirgan sana)
  email        TEXT

Eslatma: PostgreSQL sintaksisidan foydalaning.

----------------------------------------------------------------
SQL — 1-VAZIFA:  Filtr + alias + tartib   (10 ball)
----------------------------------------------------------------
Maoshi 8 000 000 so'mdan past bo'lgan (NULL bo'lmagan) xodimlarni
chiqaring. Faqat ism, bo'lim va maoshni ko'rsating.

Talablar:
  - Ustun nomlarini alias bilan o'zbekcha chiqaring:
        name -> "Xodim", department -> "Bo'lim", salary -> "Maosh".
  - Natija maosh bo'yicha o'sish tartibida (ASC) saralangan bo'lsin.
  - NULL maoshli xodimlar natijaga TUSHMASLIGI kerak.


----------------------------------------------------------------
SQL — 2-VAZIFA:  AND / OR + qavs (operator precedence)   (10 ball)
----------------------------------------------------------------
"IT" bo'limida ishlaydigan VA (Toshkent YOKI Samarqandda yashaydigan)
xodimlarni chiqaring.

Talablar:
  - AND va OR ni to'g'ri qavslang. Mantiq aniq bo'lsin:
        bo'lim majburiy 'IT', shahar esa ikkitadan biri.
  - Natijada ism, bo'lim va shaharni ko'rsating.

Savol (kodingiz tagiga izoh sifatida yozing):
  Agar qavs ishlatilmasa, so'rov natijasi qanday o'zgaradi va nega?


----------------------------------------------------------------
SQL — 3-VAZIFA:  NOT IN, NOT BETWEEN, LIKE   (10 ball)
----------------------------------------------------------------
Quyidagi SHARTLARNING HAMMASIGA mos xodimlarni chiqaring:
  - bo'limi 'Sales', 'HR', 'Support' dan biri EMAS (NOT IN);
  - maoshi 7 000 000 — 15 000 000 oralig'iga TUSHMAYDI (NOT BETWEEN);
  - email manzili '@gmail.com' bilan tugaydi (LIKE).

Talablar:
  - Uchala shart bir so'rovda birlashtirilsin.
  - Natija ism bo'yicha alifbo tartibida saralangan bo'lsin.


----------------------------------------------------------------
SQL — 4-VAZIFA:  Aggregate funksiyalar + GROUP BY   (10 ball)
----------------------------------------------------------------
Har bir bo'lim (department) bo'yicha quyidagilarni hisoblang:
  - xodimlar soni                       -> "Xodimlar_soni"
  - o'rtacha maosh                      -> "Ortacha_maosh"
  - eng yuqori maosh                    -> "Eng_yuqori"
  - eng past maosh                      -> "Eng_past"
  - bo'limdagi umumiy maosh fondi (SUM) -> "Umumiy_fond"

Talablar:
  - Natija bo'lim bo'yicha guruhlangan bo'lsin (GROUP BY).
  - Natija umumiy maosh fondi bo'yicha kamayish tartibida (DESC) saralansin.


----------------------------------------------------------------
SQL — 5-VAZIFA:  GROUP BY + HAVING   (10 ball)
----------------------------------------------------------------
Faqat o'rtacha maoshi 10 000 000 so'mdan YUQORI bo'lgan bo'limlarni
chiqaring.

Talablar:
  - Har bir bo'lim uchun: bo'lim nomi va o'rtacha maosh ko'rsatilsin.
  - Filtr GROUP BY dan keyin qo'llanilsin (HAVING ishlatish shart).


----------------------------------------------------------------
SQL — 6-VAZIFA:  GROUP BY + bir nechta aggregate + saralash   (10 ball)
----------------------------------------------------------------
Har bir SHAHAR (city) bo'yicha quyidagilarni hisoblang:
  - shahardagi xodimlar soni            -> "Xodimlar_soni"
  - shahardagi o'rtacha maosh           -> "Ortacha_maosh"
  - shahardagi umumiy maosh fondi (SUM) -> "Umumiy_fond"

Talablar:
  - Natija shahar bo'yicha guruhlangan bo'lsin (GROUP BY).
  - Faqat kamida 3 ta xodimi bor shaharlar chiqsin (HAVING).
  - Natija o'rtacha maosh bo'yicha kamayish tartibida (DESC) saralansin.
  - Maoshi NULL bo'lgan qatorlar o'rtacha hisobiga ta'sir qilmasligini
    yodda tuting (AVG NULL larni o'zi tashlab ketadi).
