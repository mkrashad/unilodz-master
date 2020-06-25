from gi.repository import Gtk
import gi
gi.require_version("Gtk", "3.0")


class MyWindow(Gtk.Window):
    # Constructor
    def __init__(self):
        # Window Title
        Gtk.Window.__init__(self, title="Rashad's Cipher 1.0")
        # Window Size
        Gtk.Window.set_default_size(self, 600, 200)
        # Window Border
        self.set_border_width(20)

        # Box Layout
        self.grid = Gtk.Grid()
        self.grid.set_column_spacing(10)
        self.grid.set_row_spacing(10)
        self.add(self.grid)

        # Label Title 1
        self.label_title1 = Gtk.Label(
            "Please write safe prime, generator and cipher text")
        self.grid.attach(self.label_title1, 0, 0, 10, 2)

        # Label Safe Prime
        self.label_prime = Gtk.Label("Safe prime: ")
        self.grid.attach(self.label_prime, 0, 3, 1, 2)

        # Entry Safe Prime
        self.entry_prime = Gtk.Entry()
        self.grid.attach(self.entry_prime, 1, 3, 1, 2)

        # Label Generator
        self.label_generator = Gtk.Label("Generator: ")
        self.grid.attach(self.label_generator, 2, 3, 1, 2)

        # Entry Generator
        self.entry_generator = Gtk.Entry()
        self.grid.attach(self.entry_generator, 3, 3, 1, 2)

        # Label Cipher Text
        self.label_cipher = Gtk.Label("Cipher Text: ")
        self.grid.attach(self.label_cipher, 4, 3, 1, 2)

        # Entry Cipher Text
        self.entry_cipher = Gtk.Entry()
        self.grid.attach(self.entry_cipher, 5, 3, 1, 2)

        # Label Title 2
        self.label_title2 = Gtk.Label(
            "Please provide Alice's public key and Bob's private key"
        )
        self.grid.attach(self.label_title2, 0, 5, 10, 2)

        # Label Alice public key
        self.label_alice = Gtk.Label("Public Key: ")
        self.grid.attach(self.label_alice, 0, 7, 1, 2)

        # Entry Alice public key
        self.entry_alice = Gtk.Entry()
        self.grid.attach(self.entry_alice, 1, 7, 1, 2)

        # Label Bob private key
        self.label_bob = Gtk.Label("Private Key: ")
        self.grid.attach(self.label_bob, 2, 7, 1, 2)

        # Entry Bob private key
        self.entry_bob = Gtk.Entry()
        self.grid.attach(self.entry_bob, 3, 7, 1, 2)

        # Button Decrypt
        self.button_decrypt = Gtk.Button(label="Decrypt")
        self.button_decrypt.connect("clicked", self.main)
        self.grid.attach(self.button_decrypt, 4, 7, 2, 2)

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

    def main(self, widget):
        # Get Safe Prime
        # p = 16487
        p = int(self.entry_prime.get_text())
        # Get Generator
        # g = 14
        g = int(self.entry_generator.get_text())
        # Get Cipher text
        # c1 = 15989
        c1 = int(self.entry_cipher.get_text())
        # Get Alice Public key
        # A = 2454
        A = int(self.entry_alice.get_text())
        # Get Bob Private key
        # b = 3259
        b = int(self.entry_bob.get_text())
        # Get Bob's public key, shared secret, inverse modular and original pin
        B, ss, x, y = self.compute(p, g, c1, A, b)
        # B = 2334
        # ss = 4459
        # x = 9484
        # y =  8737
        result = "Bob's public key is: " + \
            str(B) + "\n" + "Shared secret is: " + str(ss) + "\n" + "Inverse modular of ss is: " + \
            str(x) + "\n" + "Debit/Credit card's PIN number is: " + str(y)
        print(result)

        # Dialog Box
        dialog = Gtk.MessageDialog(
            self,
            0,
            Gtk.MessageType.INFO,
            Gtk.ButtonsType.OK,
            "The ciphertext decrypted successfully"
        )
        dialog.format_secondary_text(
            result
        )
        dialog.run()
        print("INFO dialog closed")

        dialog.destroy()


win = MyWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
