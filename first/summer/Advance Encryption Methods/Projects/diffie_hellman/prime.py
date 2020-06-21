from random import choice


def isPrime(number):
    if number > 1:
        for i in range(2, number):
            if (number % i) == 0:
                return False
                break
        else:
            return True
    else:
        return False


p = isPrime(8)
print(p)
# primes = [i for i in range(1, 10) if isPrime(i)]
# n = choice(primes)
# print(n)
