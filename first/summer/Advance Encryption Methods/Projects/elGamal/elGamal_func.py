class Function():
    def egcd(self, a, b):
        if a == 0:
            return (b, 0, 1)
        else:
            gcd, x, y = self.egcd(b % a, a)
            return(gcd, y - (b//a) * x, x)

    def inverse_modular(self, gcd, x, y, p):
        if gcd == 1:
            if x < 0:
                ss1 = p - (-x % p)
            else:
                ss1 = x + p
            return ss1

    def compute(self, p, g, c1, A, b):
        # B - public key
        # B = g^b mod p
        B = (g**b) % p
        # ss - shared Secret
        # ss = A^b mod p
        ss = (A**b) % p
        # EGCD
        gcd, x, y = self.egcd(ss, p)
        # Modular inverse
        # x = (ss**-1) % p
        x = self.inverse_modular(gcd, x, y, p)
        # Clear Text
        y = x * c1 % p
        return B, ss, x, y
