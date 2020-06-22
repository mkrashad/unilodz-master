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
        check_prime = (2*p) + 1
        if is_prime(check_prime):
            new_prime.append(p)
    random_safe_prime = random.choice(new_prime)
    return random_safe_prime


def main():
    start = int(input("Enter start value "))
    end = int(input("Enter end value "))
    p = safe_prime(start, end)
    g = random.randint(2, p-2)
    try:
        v = pow(g, (p-1)/2) % p
    except OverflowError:
        v = float('inf')
    # v = g**((p-1)/2) % p
    if v == 1:
        print("We are failed, play this game again")
    else:
        print("Diffie-Hellman parameters are: (p,g)", p, g)


if __name__ == "__main__":
    main()
