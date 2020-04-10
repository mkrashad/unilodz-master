def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        gcd, x, y = egcd(b % a, a)
        return(gcd, y - (b//a) * x, x)


def show_text():
    a = int(input("Enter num1: "))
    b = int(input("Enter num2: "))
    gcd, x, y = egcd(a, b)
    if gcd == 1:
        if x < 0:
            a1 = b - (-x % b)
        else:
            a1 = x + b
        str1 = f'gcd({a}, {b}) = {gcd} = ({x}) * {a} + ({y}) * {b}'
        str2 = f'inverse of {a} mod {b} = {a1}'
        print(str1)
        print(str2)
    else:
        str1 = f'gcd({a}, {b}) = {gcd} = ({x}) * {a} + ({y}) * {b}'
        str2 = f'{a} is NOT invertible modulo {b}!!!'
        print(str1)
        print(str2)


show_text()
