Qoyil! Haqiqiy dasturchilar xarakteri — bitta muammoni hal qilgach, tanaffus qilmasdan darhol keyingisiga o'tish.

Unday bo'lsa, siz tanlagan jiddiy nom ostida **"Project_Nexus"** loyihasini boshlaymiz. Bu safar biz dasturchining kunlik ish vazifalarini (tasks) va GitHub'dagi faolligini nazorat qiluvchi baza quramiz.

Klaviaturani tayyorlang, vaqt ketdi! ⏱

# ================================================================
3-QISM: "PROJECT_NEXUS" VAZIFALAR BAZASI (60 ball)

Biz bitta asosiy jadval ustida ishlaymiz. Jadval tuzilishi quyidagicha bo'lishi kerak:

## **`dev_tasks`** (Dasturlash vazifalari)

`id`              INTEGER   (Asosiy kalit)
`project_name`    TEXT      (Loyihalar: 'Telegram Bot', 'Portfolio', 'API')
`task_desc`       TEXT      (Vazifa tavsifi, masalan: 'Reklama postlari mexanizmini yozish')
`status`          TEXT      (Holati: 'Jarayonda', 'Kutilmoqda', 'Tugatildi')
`github_commits`  INTEGER   (GitHub'dagi yashil katakchalar / commit'lar soni)
`hours_spent`     NUMERIC   (Vazifaga sarflangan vaqt, soatda)

---

## **SQL — 1-VAZIFA: Jadvalni qoidalari bilan yaratish (10 ball)**

`dev_tasks` jadvalini yarating.
Talablar:

* `id` avtomatik raqamlansin (IDENTITY).
* `project_name` va `task_desc` ustunlari bo'sh qolmasligi shart (NOT NULL).
* `hours_spent` ustuni manfiy son bo'lmasligi kerak (CHECK).
* `status` ustunining standart qiymati 'Kutilmoqda' bo'lsin (DEFAULT).

---

## **SQL — 2-VAZIFA: Ma'lumot kiritish (10 ball)**

Jadvalga quyidagi 3 ta vazifani kiriting (bitta `INSERT` buyrug'ida).
*Eslatma: `id` va `status` ni avtomatik o'ziga qo'yib bering, kodda yozmang.*

1. Loyiha: 'Telegram Bot', Vazifa: 'SQLite bazasini ulash', Commits: 12, Vaqt: 4.5
2. Loyiha: 'Portfolio', Vazifa: 'HTML va CSS da responsiv dizayn yig'ish', Commits: 8, Vaqt: 6.0
3. Loyiha: 'Telegram Bot', Vazifa: 'Admin panel yaratish', Commits: 0, Vaqt: 0.0

---

## **SQL — 3-VAZIFA: Mantiqiy filtr (10 ball)**

'Telegram Bot' YOKI 'Portfolio' loyihasiga tegishli bo'lgan, VA sarflangan vaqti (`hours_spent`) 0 dan katta bo'lgan barcha vazifalarni ekranga chiqaring.

---

## **SQL — 4-VAZIFA: Agregatsiya va Guruhlash (10 ball)**

Har bir loyiha (`project_name`) bo'yicha quyidagilarni hisoblang:

* Loyihadagi umumiy vazifalar soni -> "Vazifalar_soni"
* Loyihaga sarflangan jami vaqt (SUM) -> "Jami_vaqt"
* Loyiha bo'yicha qilingan jami commit'lar (SUM) -> "Jami_commitlar"

Talablar: Natijani loyihalar bo'yicha guruhlang (GROUP BY).

---

## **SQL — 5-VAZIFA: Guruhni filtrlash (10 ball)**

Yuqoridagi 4-vazifa kodini kengaytiring:
Natijada faqat jami commit'lar soni 10 ta yoki undan ko'p bo'lgan (yashil katakchalari ko'p) loyihalargina ekranga chiqsin (HAVING). Natijani "Jami_vaqt" bo'yicha kamayish tartibida saralang.

---

## **SQL — 6-VAZIFA: Arxitekturani o'zgartirish (10 ball)**

Vazifalar qachon tugatilganini bilishimiz kerak.
Bitta `ALTER TABLE` buyrug'i orqali jadvalga yana ikkita yangi ustun qo'shing:

* `deadline` -> DATE (Topshirish muddati)
* `is_urgent` -> BOOLEAN (Shoshilinchmi?), standart qiymati FALSE bo'lsin.

================================================================

Barcha kodlarni tayyorlaganingizdan so'ng, bitta xabarda yuboring. Omad!
