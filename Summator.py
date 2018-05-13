import numpy as np
import math
import Asteroids
#b = 500
p_max = 0.1
sum_arr = []



def summator(name, b):
    number_arr = []
    with open(name, "r") as asteroid_file:
        data = asteroid_file.read().splitlines() #чтение данных из файла с разделением строк

        for i in range(b):
            row = data[i].split(' ') # разбиение строки на элементы, деление по запятой
            number_arr.append(float(row[1]))
    return number_arr

def sorting(input_file,output_file, num, bins):
    a = []
    with open(input_file, "r") as asteroid_file:
        data = asteroid_file.read().splitlines()  # чтение данных из файла с разделением строк
        for i in range(num + 1):
            row = data[i + 1].split(',')  # разбиение строки на элементы, деление по запятой
            a.append(float(row[1]))
    count_arr = np.zeros(int(bins), dtype=int)
    min_val = min(a)
    max_val = max(a)
    for n in range(len(a)):
        k = math.floor((a[n] - min_val) * bins / (max_val - min_val))  # определяет, в какой бин попадет значение р
        if k < bins:
            count_arr[k] += 1

    count_file = open(output_file, "w")
    x_axis = np.linspace(min_val, max_val, bins)
    for i in range(len(count_arr)):
        count_file.write(str(x_axis[i]) + " " + str(count_arr[i]) + '\n')
    count_file.close()
    print(min_val, max_val)
    print("done!")

def symmetry_sorting(input_file,mag, num, bins):
    a = []
    count_arr1 = np.zeros(int(bins), dtype=int)
    count_arr2 = np.zeros(int(bins), dtype=int)
    count_arr3 = np.zeros(int(bins), dtype=int)
    count_arr4 = np.zeros(int(bins), dtype=int)
    count_arr5 = np.zeros(int(bins), dtype=int)
    count_arrs = [count_arr1, count_arr2, count_arr3, count_arr4, count_arr5]
    gaps = [2.50196, 2.7063, 2.8253, 2.9583, 3.03091]
    dot = math.floor(bins/2)
    output_file_arr = ["2.5 {}.txt".format(mag), "2.7 {}.txt".format(mag), "2.82 {}.txt".format(mag),
                       "2.95 {}.txt".format(mag), "3.03 {}.txt".format(mag) ]
    #output_file_arr = ["2.5.txt", "2.7.txt", "2.82.txt","2.95.txt", "3.03.txt"]
    x_axis = np.linspace(0.0, 0.1, bins)
    x_axis_inv = np.linspace(0, -0.1, bins)
    with open(input_file, "r") as asteroid_file:
        data = asteroid_file.read().splitlines()  # чтение данных из файла с разделением строк
        for i in range(num + 1):
            row = data[i + 1].split(',')  # разбиение строки на элементы, деление по запятой
            a.append(float(row[1]))
    for i in range(len(gaps)):
        for n in range(len(a)):
            if abs(a[n] - gaps[i]) <= 0.1:
                k = math.floor(abs(a[n] - gaps[i]) * bins / 0.1)  # определяет, в какой бин попадет значение р
                if k < bins:
                    count_arrs[i][k] += 1
        count_file = open(output_file_arr[i], "w")
        for p in range(99, 0, -1):
            count_file.write(str(x_axis_inv[p]) + " " + str(count_arrs[i][p]) + '\n')
        for p in range(len(count_arrs[i])):
            count_file.write(str(x_axis[p]) + " " + str(count_arrs[i][p]) + '\n')
        count_file.close()
        print("done {} times!".format(i+1))

#sort_a = sorting("11-12 1412.csv","belt(11-12H)_a.txt", 1410, 500)
#sort_a1 = sorting("12-13 4971.csv","belt(12-13H)_a.txt", 4970, 500)
#sort_a2 = sorting("13-14 17858.csv","belt(13-14H)_a.txt", 17586, 500)
#sort_a3 = sorting("14-15 56306.csv","belt(14-15H)_a.txt", 56305, 500)
#sort_a4 = sorting("15-16 145650.csv","belt(15-16H)_a.txt", 145649, 500)
#sort_a5 = sorting("16-17 250000.csv","belt(16-17H)_a.txt", 249999, 500)
#sort_a6 = sorting("17-18 206000.csv","belt(17-18H)_a.txt", 205999, 500)
#sort_a7 = sorting("18-19 69700.csv","belt(18-19H)_a.txt", 69700, 500)
#sort_a8 = sorting("19-20 14600.csv","belt(19-20H)_a.txt", 14600, 500)
#sort_a1 = sorting("472 50km.csv","belt50km_a.txt", 471, 30)

sort_s1 = symmetry_sorting("19-20 14600.csv", "19-20", 14600, 100)
sort_s2 = symmetry_sorting("18-19 69700.csv", "18-19", 69700, 100)
sort_s3 = symmetry_sorting("17-18 206000.csv", "17-18", 205999, 100)
sort_s4 = symmetry_sorting("16-17 250000.csv", "16-17", 250000, 100)
sort_s5 = symmetry_sorting("15-16 145650.csv", "15-16", 145649, 100)
sort_s6 = symmetry_sorting("14-15 56306.csv", "14-15", 56305, 100)
sort_s7 = symmetry_sorting("13-14 17858.csv", "13-14", 17857, 100)
#list = Asteroids.lister("asteroid_belt(133k).csv", 133000)
#sort = Asteroids.diam_sorter(list)

#inner_arr = summator("count_file(inner).txt", b)
#outer_arr = summator("count_file(outer).txt", b)
#central_arr = summator("count_file(сentral).txt", b)
#x_axis = np.linspace(0, p_max, b)
#sum_file = open("count_file(sum).txt", "w")

#print(len(inner_arr), len(outer_arr), len(central_arr))

#for i in range(len(inner_arr)):
#    sum_arr.append(int(inner_arr[i] + outer_arr[i] + central_arr[i]))
#    sum_file.write(str(x_axis[i]) + " " + str(sum_arr[i]) + '\n')
#print(len(sum_arr))
#sum_file.close()