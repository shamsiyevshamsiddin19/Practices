

# 1-VAZIFA

class Student:
    def __init__(self, first_name, last_name, gpa):
        self.first_name = first_name
        self.last_name = last_name
        self._gpa = gpa

    @property
    def gpa(self):
        return self._gpa

    @gpa.setter
    def gpa(self, value):
        if value < 0.0 or value > 4.0:
            raise ValueError("GPA 0.0 dan 4.0 gacha bolishi kerak!")
        self._gpa = value

    @property
    def full_name(self):
        return f"{self.first_name} {self.last_name}"


# test
s = Student("Ali", "Valiyev", 3.5)
print(s.full_name)  
print(s.gpa)        
s.gpa = 3.9
print(s.gpa)        


# 2-VAZIFA

class Employee:
    def __init__(self, name, base_salary):
        self.name = name
        self.base_salary = base_salary

    def calculate_salary(self):
        return self.base_salary


class Manager(Employee):
    def __init__(self, name, base_salary, bonus):
        super().__init__(name, base_salary)
        self.bonus = bonus

    def calculate_salary(self):
        return self.base_salary + self.bonus


class Developer(Employee):
    def __init__(self, name, base_salary, overtime_hours):
        super().__init__(name, base_salary)
        self.overtime_hours = overtime_hours

    def calculate_salary(self):
        return self.base_salary + (self.overtime_hours * 50000)


# test
xodimlar = [
    Manager("Aziz", 10_000_000, 3_000_000),
    Developer("Bek", 8_000_000, 20),
]
for x in xodimlar:
    print(x.name, x.calculate_salary())



# 3-VAZIFA


from abc import ABC, abstractmethod

class PaymentMethod(ABC):

    @abstractmethod
    def pay(self, amount):
        pass

    @abstractmethod
    def validate(self):
        pass


class UzCard(PaymentMethod):
    def __init__(self, card_number):
        self.card_number = card_number

    def validate(self):
        return len(str(self.card_number)) == 16

    def pay(self, amount):
        print(f"UzCard orqali {amount} so'm to'landi")


class Humo(PaymentMethod):
    def __init__(self, card_number):
        self.card_number = card_number

    def validate(self):
        return len(str(self.card_number)) == 16

    def pay(self, amount):
        print(f"Humo orqali {amount} so'm to'landi")


class Cash(PaymentMethod):
    def validate(self):
        return True

    def pay(self, amount):
        print(f"Naqd pul orqali {amount} so'm to'landi")


def checkout(method, amount):
    if method.validate():
        method.pay(amount)
    else:
        print("Validatsiya xatosi")


# test
checkout(Cash(), 50000)
checkout(UzCard("1234567890123456"), 100000)
checkout(UzCard("12345"), 100000)         



# 4-VAZIFA

class BankError(Exception):
    pass

class InvalidAmountError(BankError):
    pass

class InsufficientFundsError(BankError):
    pass


class BankAccount:
    def __init__(self, owner, balance=0):
        self.owner = owner
        self._balance = balance

    @property
    def balance(self):
        return self._balance

    def deposit(self, amount):
        if amount <= 0:
            raise InvalidAmountError("Summa 0 dan katta bolishi kerak!")
        self._balance += amount

    def withdraw(self, amount):
        if amount <= 0:
            raise InvalidAmountError("Summa 0 dan katta bolishi kerak!")
        if amount > self._balance:
            raise InsufficientFundsError("Balansda yetarli mablag' yoq!")
        self._balance -= amount

    def __str__(self):
        return f"Hisob: {self.owner}, Balans: {self._balance} so'm"

    def __eq__(self, other):
        return self._balance == other._balance


# test
acc = BankAccount("Ali", 100000)
acc.deposit(50000)
print(acc.balance)  
print(acc)           

acc2 = BankAccount("Vali", 150000)
print(acc == acc2)   

try:
    acc.withdraw(999999)
except InsufficientFundsError as e:
    print(e)        
