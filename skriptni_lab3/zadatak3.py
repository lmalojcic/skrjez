#!/usr/bin/python3
import sys
import os

folder = sys.argv[1]
student_file = open(folder + "/studenti.txt", "r")
student_lines = student_file.read().splitlines()
student_file.close()
students = {}
for line in student_lines:
    list = line.split()
    temp_dict = {}
    temp_dict["prezime"] = list[1]
    temp_dict["ime"] = list[2]
    temp_dict["L1"] = "-"
    temp_dict["L2"] = "-"
    temp_dict["L3"] = "-"
    students[list[0]] = temp_dict
student_file.close()

file_list = os.listdir(folder)
for file in file_list:
    if file[0:3] == "Lab":
        lab_file = open(folder + "/" + file, "r")
        lab_lines = lab_file.read().splitlines()
        lab_file.close()
        name_list = file.split("_")
        lab = "L" + str(int(name_list[1]))
        for line in lab_lines:
            list = line.split()
            if (students[list[0]][lab] != "-"):
                print("Warning: student " + list[0] + " has multiple grades for " + lab + "!")
            students[list[0]][lab] = list[1]

print("JMBAG     \tPrezime, Ime\t\tL1\tL2\tL3")
for key in students:
    print(key + "\t" + students[key]["prezime"] + ", " + students[key]["ime"] + "\t\t" + students[key]["L1"] + "\t" + students[key]["L2"] + "\t" + students[key]["L3"])
