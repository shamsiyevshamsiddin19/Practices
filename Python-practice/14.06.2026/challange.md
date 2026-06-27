
================================================================
        PYTHON OOP 
================================================================

----------------------------------------------------------------
OOP — 1-VAZIFA:  Klass, __init__, property, validatsiya   (10 ball)
----------------------------------------------------------------
"Talaba" (Student) klassini yozing.

Konstruktor (__init__) qabul qiladi:
  - first_name  — ism (string)
  - last_name   — familiya (string)
  - gpa         — o'rtacha baho (0.0 dan 4.0 gacha)

Talablar:
  1. "gpa" ni private atribut sifatida saqlang (_gpa).
  2. "gpa" uchun property va setter yozing. Setter tekshirsin:
        - qiymat 0.0 dan 4.0 gacha bo'lishi kerak.
        - agar oraliqdan chiqsa, ValueError ko'taring.
  3. "full_name" — read-only property bo'lsin. U first_name va
     last_name dan hosil qilinadi (masalan: "Ali Valiyev").
        - full_name ni tashqaridan o'zgartirib bo'lmasligi kerak.

Namuna:
  s = Student("Ali", "Valiyev", 3.5)
  print(s.full_name)   # Ali Valiyev
  s.gpa = 3.9          # ishlaydi
  s.gpa = 5.0          # ValueError ko'tarilishi kerak


----------------------------------------------------------------
OOP — 2-VAZIFA:  Inheritance va metodni qayta yozish (override) (10 ball)
----------------------------------------------------------------
Quyidagi klasslar ierarxiyasini yozing.

  1. Bazaviy klass "Employee" (xodim):
        - __init__: name (ism), base_salary (asosiy maosh)
        - metod calculate_salary() — base_salary ni qaytaradi.

  2. "Manager" klassi Employee dan meros oladi:
        - calculate_salary() ni qayta yozadi (override):
          base_salary + bonus qaytaradi.
        - bonus konstruktorda qabul qilinadi.

  3. "Developer" klassi Employee dan meros oladi:
        - calculate_salary() ni qayta yozadi:
          base_salary + (overtime_hours * 50000) qaytaradi.
        - overtime_hours konstruktorda qabul qilinadi.

Talablar:
  - super() dan to'g'ri foydalaning.
  - Quyidagi kod ishlashi kerak:

      xodimlar = [
          Manager("Aziz", 10_000_000, 3_000_000),
          Developer("Bek", 8_000_000, 20),
      ]
      for x in xodimlar:
          print(x.name, x.calculate_salary())


----------------------------------------------------------------
OOP — 3-VAZIFA:  Abstraction (ABC) va Polymorphism   (10 ball)
----------------------------------------------------------------
To'lov tizimini yozing.

  1. "PaymentMethod" — abstrakt bazaviy klass (abc moduli orqali):
        - abstrakt metod: pay(amount)
        - abstrakt metod: validate()

  2. Uchta konkret klass yozing — har biri PaymentMethod dan meros oladi
     va ikkala abstrakt metodni amalga oshiradi:
        - "UzCard"  — validate(): karta raqami aniq 16 xonali bo'lsa True.
        - "Humo"    — validate(): karta raqami aniq 16 xonali bo'lsa True.
        - "Cash"    — validate(): doim True (naqd pulda karta yo'q).
     pay(amount) har bir klassda o'ziga xos matn chiqarsin
     (masalan: "UzCard orqali 50000 so'm to'landi").

  3. "checkout(method, amount)" funksiyasini yozing:
        - avval method.validate() ni tekshiradi.
        - agar True bo'lsa, method.pay(amount) ni chaqiradi.
        - agar False bo'lsa, "Validatsiya xatosi" deb chiqaradi.

Eslatma: checkout funksiyasi qaysi to'lov turi ekanini bilmasligi kerak —
bu polymorphism (bir interfeys, har xil xatti-harakat).


----------------------------------------------------------------
OOP — 4-VAZIFA:  Encapsulation, dunder metodlar, custom exception (10 ball)
----------------------------------------------------------------
"BankAccount" (bank hisobi) klassini yozing.

  1. Konstruktor: owner (egasi), balance (boshlang'ich balans, default = 0).
        - balance ni private saqlang (_balance).

  2. "balance" — read-only property (faqat o'qish mumkin).

  3. Metodlar:
        - deposit(amount):  balansni oshiradi.
              amount <= 0 bo'lsa, "InvalidAmountError" ko'taring.
        - withdraw(amount): balansdan yechadi.
              amount <= 0 bo'lsa, "InvalidAmountError" ko'taring.
              amount > balance bo'lsa, "InsufficientFundsError" ko'taring.

  4. Custom exception'lar:
        - "InvalidAmountError" va "InsufficientFundsError" yozing.
        - Ikkalasi ham "BankError" degan umumiy bazaviy
          exception'dan meros olsin.

  5. Dunder metodlar:
        - __str__:  "Hisob: <egasi>, Balans: <balance> so'm" qaytarsin.
        - __eq__:   ikki hisob balansi teng bo'lsa True qaytarsin.

Namuna:
  acc = BankAccount("Ali", 100000)
  acc.deposit(50000)
  print(acc.balance)   # 150000
  acc.withdraw(999999) # InsufficientFundsError
  print(acc)           # Hisob: Ali, Balans: 150000 so'm

