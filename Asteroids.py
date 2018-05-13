import numpy as np
import math



def lister(filename, amount):
    ast_arr = []
    with open(filename, "r") as asteroid_file:
        data = asteroid_file.read().splitlines()  # чтение данных из файла с разделением строк

    for n in range(amount + 1):
        row = data[n + 1].split(',')  # разбиение строки на элементы, деление по запятой
        ast_arr[n][0].append(str(row[0]))  # name
        ast_arr[n][1].append(float(row[1]))  # a
        ast_arr[n][2].append(float(row[2]))  #  ecc
        ast_arr[n][3].append(float(row[3]))  #  inc
        ast_arr[n][4].append(float(row[4]))  # diam

    return ast_arr


def diam_sorter(asteroid_arr):
    diam = [1, 2, 3, 5, 10, 20, 30, 50]  # размеры астероидов для распределения
    asteroids1km = []
    asteroids2km = []
    asteroids3km = []
    asteroids5km = []
    asteroids10km = []
    asteroids20km = []
    asteroids30km = []
    asteroids50km = []
    asteroid_bins = [asteroids1km, asteroids2km, asteroids3km, asteroids5km, asteroids10km, asteroids20km,
                     asteroids30km, asteroids50km]

    min_val = 2.0
    max_val = 3.27
    bins_number = 500
    count_arr1km = count_arr2km = count_arr3km = count_arr5km = count_arr10km = count_arr20km = count_arr30km = count_arr50km = np.zeros(
        bins_number, dtype=int)
    count_arr_set = [count_arr1km, count_arr2km, count_arr3km, count_arr5km, count_arr10km, count_arr20km,
                     count_arr30km, count_arr50km]
    i = 0
    for n in range(len(asteroid_arr)):
        if asteroid_arr[n][4] <= diam[0]:
            asteroids1km.append(asteroid_arr[n])
        elif diam[0] < asteroid_arr[n][4] < diam[1]:
            asteroids2km.append(asteroid_arr[n])
        elif diam[1] < asteroid_arr[n][4] < diam[2]:
            asteroids3km.append(asteroid_arr[n])
        elif diam[2] < asteroid_arr[n][4] < diam[3]:
            asteroids5km.append(asteroid_arr[n])
        elif diam[3] < asteroid_arr[n][4] < diam[4]:
            asteroids10km.append(asteroid_arr[n])
        elif diam[4] < asteroid_arr[n][4] < diam[5]:
            asteroids20km.append(asteroid_arr[n])
        elif diam[5] < asteroid_arr[n][4] < diam[6]:
            asteroids30km.append(asteroid_arr[n])
        elif diam[6] < asteroid_arr[n][4] <= diam[7]:
            asteroids50km.append(asteroid_arr[n])

    for asteroid_bins[i] in range(len(asteroid_bins)):
        for n in range(len(asteroid_bins[i + 1])):
            k = math.floor((asteroid_bins[i][n][1] - min_val) * bins_number / (
            max_val - min_val))  # определяет, в какой бин попадет значение р
            if k < bins_number:
                count_arr_set[i][k] += 1

    name = ["ast1km.txt", "ast2km.txt", "ast3km.txt", "ast5km.txt", "ast10km.txt", "ast20km.txt", "ast30km.txt",
            "ast50km.txt"]
    for p in range(8):
        count_file = open(name[p], "w")
        x_axis = np.linspace(min_val, max_val, bins_number)
        for i in range(len(count_arr_set[i] + 1)):
            count_file.write(str(x_axis[i]) + " " + str(count_arr_set[i]) + '\n')
        count_file.close()

