def prime(num):
    if num > 1:
        for i in range(2, num):
            if (num % i) == 0:
                return None
                break
        else:
            return num
    else:
        return None


def safe_prime(p):
    if p == None:
        print("isn't prime")
    else:
        safe_prime = (2*p) + 1
        print(safe_prime)


def main():
    n = int(input("Write any number "))
    p = prime(n)
    safe_prime(p)


if __name__ == "__main__":
    main()
