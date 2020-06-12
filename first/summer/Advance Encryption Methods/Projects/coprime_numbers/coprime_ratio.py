from random import randint
from sys import maxsize


def find_gcd(a, b):
    if b == 0:
        return a
    else:
        return find_gcd(b, a % b)


def coprime_count(length, trials):
    count = 0
    for i in range(trials):
        number2 = find_gcd(randint(1, maxsize), randint(1, maxsize))
        number3 = find_gcd(number2, randint(1, maxsize))
        number4 = find_gcd(number3, randint(1, maxsize))
        number5 = find_gcd(number4, randint(1, maxsize))
        number6 = find_gcd(number5, randint(1, maxsize))
        if (length == 2 and number2 == 1) or (length == 3 and number3 == 1) or (length == 4 and number4 == 1) or (length == 5 and number5 == 1) or (length == 6 and number6 == 1):
            count += 1
    return count


def coprime_ratio(length, trials):
    success = coprime_count(length, trials)
    ratio = success / trials * 100
    # print(
    # f'The frequency coprime of {length} numbers with length {trials} and success {success} is {ratio}%')
    print("The frequency coprime of", length, "numbers with trials",
          trials, "and success", success, "is", ratio, "%")


def main():
    length = int(input("Write length from 2 to 6: "))
    if length >= 2 and length <= 6:
        trials = int(input("Please write the trials: "))
        coprime_ratio(length, trials)
    else:
        print("The length out of the range")


if __name__ == '__main__':
    main()
