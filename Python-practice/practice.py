# lesson 1

from shapely import length


dokon_nomi = "uber"
mahsulotlar_soni = 3
mahsulotlar_soni = 5


# lesson 2
mahsulot_narxi = 1500
mahsulotlar_soni = 5
jami_summa = mahsulotlar_soni * mahsulot_narxi
print(jami_summa)

# Lesson 3

budjet = 10000
narx = 12000
if budjet >= narx:
    print("sotib olsak bo'ladi ")
else:
    print("pulim yetmaydi ")


# lesson 4
harorat = None
harorat = int(input("haroratni kriting:"))
if harorat > 30:
    print("issiq")
elif 15 <= harorat <= 30:
    print("Iliq")
else:
    print("soviq")


# lesson 5
bozorlik = ["non", "sut", "go'sht", "olma"]
print(bozorlik[1])

# lesson 6
talabalar = ("ali", "vali", "bobur", "shamsiddin", "doston")
for t in talabalar:
    print(f"{talabalar.index(t) + 1}. {t} ")

# lesson 7
# 1
for i in range(1, 11, 1):
    print(i)
# 2
i = 0
while i <= 10:
    if i % 2 == 0:
        print(i)
    i += 1

# 3

for i in range(1,101,1):
    if i%7==0:
        print(f"birinchi 7 ga bo'linga son: {i}")
        break

# 4
for i in range(1,6,1):
    for j in range(1,6,1):
        print(f"{i} x {j} = {i*j}")
    print("")

# 5

ismlar = ["Ali", "Vali", "Guli", "Nodira"]
for i in range(ismlar.index("Ali"),len(ismlar)+1,1):
    print(f"{ismlar.index(ismlar[i])} - {ismlar[i]}")

# lesson 9

# 1
def kub(son):
    return son**3
kub(3)

# 2
def maxx(a,b):
    if a>b:
       return a
    elif a==b:
        return "teng"
    else:
        return  b
maxx(20,3)


# 3

def juft(son):
        return   son % 2 ==0
juft(5)