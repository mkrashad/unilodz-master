from alphabet import alphabet


def egcd(alpha, mod):
    if alpha == 0:
        return (mod, 0, 1)
    else:
        gcd, x, y = egcd(mod % alpha, alpha)
        return(gcd, y - (mod//alpha) * x, x)


def inverse_modulo(alpha, mod):
    gcd, x, y = egcd(alpha, mod)
    if gcd == 1:
        if x < 0:
            a1 = mod - (-x % mod)
        else:
            a1 = x + mod
        return a1
    else:
        str1 = f'{alpha} is NOT invertible modulo {mod}!!!'
        return str1


def affine_encrypt(alpha, beta, char, mod):
    char_to_cipher = ((alpha * char) + beta) % mod
    print(char_to_cipher)


def affine_decrypt(alpha, beta, mod):
    alpha = inverse_modulo(alpha, mod)
    with open('to_decryption.txt', 'r') as rf:
        with open('decrypted.txt', 'w') as wf:
            for line in rf:
                splited = line.split()
                for i in splited:
                    cipher = int(i)
                    cipher_to_char = str((alpha * (cipher - beta)) % mod)
                    for key in alphabet.keys():
                        if key == cipher_to_char:
                            wf.write(str(alphabet[key]))


def main():
    print("Please select one of the two options:")
    print("1: Encrypt the letter")
    print("2: Decrypt the file")
    option = int(input("Enter the number: "))
    if option == 1:
        alpha = int(input("Write alpha "))
        beta = int(input("Write beta "))
        char = int(input("Write char position in alphabet "))
        module = int(input("Write module "))
        # affine_encrypt(7, 2, 6, 26)
        affine_encrypt(alpha, beta, char, module)
    elif option == 2:
        alpha = int(input("Write alpha "))
        beta = int(input("Write beta "))
        module = int(input("Write module "))
        # affine_decrypt(66, 38, 97)
        affine_decrypt(alpha, beta, module)
    else:
        print("The option doesn't exist")


if __name__ == '__main__':
    main()
