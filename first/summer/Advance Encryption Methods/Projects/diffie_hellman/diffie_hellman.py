import random
from math import pow


def is_prime(number):
    if number > 1:
        for i in range(2, number):
            if (number % i) == 0:
                return False
                break
        else:
            return True
    else:
        return False


def safe_prime(start, end):
    new_prime = []
    primes = [i for i in range(start, end) if is_prime(i)]
    for p in primes:
        check_prime = int((p-1)/2)
        if is_prime(check_prime):
            new_prime.append(p)
    random_safe_prime = random.choice(new_prime)
    return random_safe_prime


def powm(x, y, p):
    res = 1
    x = x % p
    if (x == 0):
        return 0
    while (y > 0):
        if ((y & 1) == 1):
            res = (res * x) % p
        y = y >> 1
        x = (x * x) % p
    return res


def main():
    start = int(input("Enter start value "))
    end = int(input("Enter end value "))
    p = safe_prime(start, end)
    r = int((p-1)/2)
    g = random.randint(2, p-2)
    try:
        # v = int(pow(g, (p-1)/2)) % p
        v = powm(g, r, p)
    except OverflowError:
        v = float('inf')
    if v == 1:
        print("We are failed, play this game again")
    else:
        print("Diffie-Hellman parameters are: (p,g)", p, g)


if __name__ == "__main__":
    main()
