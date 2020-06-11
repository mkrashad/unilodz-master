from random import randint
from math import ceil


def find_gcd(a, b):
    if a == 0 or b == 0:
        return a
    else:
        return find_gcd(b, a % b)


def coprime_count(num):
    count = 0
    for i in range(num):
        x = find_gcd(randint(1, 100), randint(1, 100))
        if x == 1:
            count += 1
    return count


def nat_numbers():
    numbers = int(input("Write number from 2 to 6: "))
    if numbers == 2:
        my_length = int(input("Please write the length: "))
        success = coprime_count(my_length)
        ratio = success / my_length * 100
        print(
            f'The frequency coprime of {numbers} numbers with length {my_length} and success {success} is {ceil(ratio)}%')
    elif numbers == 3:
        num1 = 8
        num2 = 4
        gcd = find_gcd(num1, num2)
        gcd = find_gcd(gcd, 3)
        print(gcd)


def main():
    # numbers = int(input("Write number from 2 to 6: "))
    # if numbers == 2:
    #     my_length = int(input("Please write the length: "))
    #     success = coprime_count(my_length)
    #     ratio = success / my_length * 100
    #     print(
    #         f'The frequency coprime of length {my_length} and success {success} is {ceil(ratio)}%')
    # else:
    #     print("Bad number")
    # num1 = 8
    # num2 = 4
    # gcd = find_gcd(num1, num2)
    # gcd = find_gcd(gcd, 3)
    # print(gcd)
    nat_numbers()


if __name__ == '__main__':
    main()
