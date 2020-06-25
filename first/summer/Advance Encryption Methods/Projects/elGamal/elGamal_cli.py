def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        gcd, x, y = egcd(b % a, a)
        return(gcd, y - (b//a) * x, x)


def inverse_modular(gcd, x, y, p):
    if gcd == 1:
        if x < 0:
            ss1 = p - (-x % p)
        else:
            ss1 = x + p
        return ss1


def compute(p, g, c1, A, b):
    # B - public key
    # B = g^b mod p
    B = (g**b) % p
    # ss - shared Secret
    # ss = A^b mod p
    ss = (A**b) % p
    # EGCD
    gcd, x, y = egcd(ss, p)
    # Modular inverse
    # x = (ss**-1) % p
    x = inverse_modular(gcd, x, y, p)
    # Clear Text
    y = x * c1 % p
    return B, ss, x, y


def main():
    #  Public
    p = int(input("Write safe prime: "))
    # p = 16487
    g = int(input("Write generator: "))
    # g = 14

    # Alice
    # a - private key
    # A - public key
    # A = g^a mod p
    # C1 - cipher text
    # Bob
    # b - private key
    # B - public key

    c1 = int(input("Write cipher text: "))
    # C1 = 15989

    A = int(input("Write Alice's public key: "))
    # A = 2454

    b = int(input("Write Bob's private key: "))
    # b = 3259

    # Get Bob's public key, shared secret, inverse modular and original pin
    B, ss, x, y = compute(p, g, c1, A, b)

    # B = 2334
    print("Bob's public key is:", B)

    # ss = 4459
    print("Shared secret is:", ss)

    # x = 9484
    print("Inverse modular of ss is:", x)

    # y =  8737
    print("Debit/Credit card's PIN number is:", y)


if __name__ == "__main__":
    main()
