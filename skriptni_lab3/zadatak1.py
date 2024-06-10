#!/usr/bin/python3
import sys

def transform_matrix(rare_matrix):
    shape = rare_matrix[0].split()
    rows, cols = int(shape[0]), int(shape[1])
    matrix = [[0 for x in range(cols)] for y in range(rows)]
    for element in rare_matrix[1:]:
        list = element.split()
        matrix[int(list[0])][int(list[1])] = int(list[2])
    return matrix

def print_matrix(matrix_dict):
    for key in matrix_dict:
        matrix = matrix_dict[key]
        print(key + ":")
        for row in matrix:
            for col in row:
                print("{:6.2f}".format(col), end=" ")
            print()
    print() 

def muliply_matrix(matrix_A, matrix_B):
    matrix_A_list = matrix_A["A"]
    matrix_B_list = matrix_B["B"]
    if len(matrix_A_list[0]) != len(matrix_B_list):
        print("Error with matrix dimensions!")
        sys.exit()

    result_matrix = [[0 for x in range(len(matrix_B_list[0]))] for y in range(len(matrix_A_list))]
    for i in range(len(matrix_A_list)): 
        for j in range(len(matrix_B_list[0])): 
            for k in range(len(matrix_B_list)): 
                result_matrix[i][j] += matrix_A_list[i][k] * matrix_B_list[k][j]
    return result_matrix

def save_matrix(matrix_dict):
    matrix_list = matrix_dict["A*B"]
    result_file = open("rezultati.txt", "w")
    result_file.write(str(len(matrix_list)) + " " + str(len(matrix_list[0])) + "\n")
    for i in range(len(matrix_list)):
        for j in range(len(matrix_list[0])):
            if matrix_list[i][j] != 0:
                result_file.write(str(i) + " " + str(j) + " " + str(matrix_list[i][j]) + "\n")
    result_file.close()


x = sys.argv[1]

f = open(x, "r")
lines = f.read().splitlines()
f.close()

for i in range(len(lines)):
    if lines[i] == "":
        raw_A = lines[:i]
        raw_B = lines[i+1:]
        break
matrix_A = {"A" : transform_matrix(raw_A)}
matrix_B = {"B" : transform_matrix(raw_B)}

print_matrix(matrix_A)
print_matrix(matrix_B)

result = {"A*B" : muliply_matrix(matrix_A, matrix_B)}

print_matrix(result)
save_matrix(result)
 