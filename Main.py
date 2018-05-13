import random
import math
import matplotlib.pyplot as plt
import numpy as np

#========================================
a = []
a_log = []
inc_sin = []
ecc = []
inc = []
ast = []
p_list = []
#=========== важные переменные ==========
b = 500        # число бинов, на которое разбивается гистограмма
p_max = 0.01     #ограничение гистограммы справа
num = 126000 #число астероидов для которых производится расчет
#========================================


with open("whole_belt(126k)<10km.csv", "r") as asteroid_file:
    data = asteroid_file.read().splitlines() #чтение данных из файла с разделением строк

    for i in range(num+1):
        row = data[i+1].split(',') # разбиение строки на элементы, деление по запятой
        a.append(float(row[1]))
        ecc.append(float(row[2]))
        inc.append(float(row[3]))

a_aver = sum(a)/len(a)  #вычисление средних
ecc_aver = sum(ecc)/len(ecc)
inc_aver = sum(inc)/len(inc)

for i in range(len(a)):
    a_log.append(math.log(a[i]))
    inc_sin.append(math.sin(math.radians(inc[i])))

def sorting(b, type):
    count_arr = np.zeros(int(b), dtype=int)
    min_val = min(type)
    max_val = max(type)
    for n in range(len(type)):
        k = math.floor((type[n]-min_val) * b / (max_val-min_val))  # определяет, в какой бин попадет значение р
        if k < b:
            count_arr[k] += 1
    return count_arr


def interact(b,p_max, num):
    count_arr = np.zeros(int(b), dtype=int)
    phase_dist = open("phase_dist.txt", "w")
    try:
        for n in range(num):
            for i in range(n):
                p = (5/4*((a[n]-a[i])/(a[n]+a[i])*2)**2+2*(math.sin(inc[n]/57.3)-math.sin(inc[i]/57.3))**2+(2*(ecc[n]-ecc[i]))**2)**(0.5)
                p_list.append(p)
                k = math.floor(p*b/p_max) # определяет, в какой бин попадет значение р
                if k < b:
                    count_arr[k] += 1
                print('processing.... ', round(len(p_list)*200/(num**2),2), "%", end="\r")
    except KeyboardInterrupt:
        phase_dist.write(str(p_list))
        phase_dist.write("\n")
        phase_dist.close()

    return count_arr

def interact2(b,p_max, num):
    count_arr = np.zeros(int(b), dtype=int) # массив с бинами
    phase_dist = open("phase_dist.txt", "w")
    k_a = math.sqrt(5/4)
    try:
        for n in range(num):
            for i in range(n, num, 1):
                if a[i] > (a[n] + p_max*a[n]/k_a):
                    break
                p = (5/4*((a[n]-a[i])/(a[n]+a[i])*2)**2+2*(math.sin(inc[n]/57.3)-math.sin(inc[i]/57.3))**2+(2*(ecc[n]-ecc[i]))**2)**(0.5)
                p_list.append(p)
                k = math.floor(p*b/p_max) # определяет, в какой бин попадет значение р
                if k < b:
                    count_arr[k] += 1
                print('processing.... ', round(len(p_list)*800/(num**2),2), "%", end="\r")
    except KeyboardInterrupt:
        phase_dist.write(str(p_list))
        phase_dist.write("\n")
        phase_dist.close()

    return count_arr

print("a_aver = ", a_aver)
print("ecc_aver = ", ecc_aver)
print("inc_aver = ", inc_aver)
a_sort = sorted(a_log)

#===================================
np.set_printoptions(linewidth = 1)
#===================================
count_file = open("count_file.txt", "w")
x_axis = np.linspace(0, p_max, b)
count = interact2(b, p_max, num)
for n in range(b):
    print(str(x_axis[n])," ", str(count[n]))
    count_file.write(str(x_axis[n]) + " " + str(count[n]) + '\n')
count_file.close()
#===================================
print("interaction_count = ", len(p_list))

#data_file = open("data_file.txt", "w")
#x_axis = np.linspace(min(inc_sin), max(inc_sin), b)
#data = sorting(b, inc_sin)
#for n in range(b):
#    print(str(x_axis[n])," ", str(data[n]))
#    data_file.write(str(x_axis[n]) + " " + str(data[n]) + '\n')
#data_file.close()
#print("done!")
#======================================
#fig = plt.figure
#b = [i/1000 for i in range(1, 20)]
#plt.hist(p_list, b)
#plt.title("Number of asteroids with designated phase distance")
#plt.xlabel("phase distance P")
#plt.ylabel("Number of asteroids")
#plt.grid(True)
#plt.show()
#======================================
