import elGamal_func
from gi.repository import Gtk
import gi
gi.require_version("Gtk", "3.0")


class MainWindow(Gtk.Window):
    def __init__(self):
        # Window Settings
        Gtk.Window.__init__(self, title="Rashad's Cipher 1.1.2")
        Gtk.Window.set_default_size(self, 500, 200)
        self.set_border_width(10)

        # Box Layout
        self.grid = Gtk.Grid()
        self.grid.set_column_spacing(10)
        self.grid.set_row_spacing(10)
        self.add(self.grid)

        # Title 1
        self.label_title1 = Gtk.Label(
            "Please write safe prime, generator and cipher text")
        self.grid.attach(self.label_title1, 0, 0, 10, 2)

        # Safe Prime
        self.label_prime = Gtk.Label("Safe prime: ")
        self.grid.attach(self.label_prime, 0, 3, 1, 2)
        self.entry_prime = Gtk.Entry()
        self.grid.attach(self.entry_prime, 1, 3, 1, 2)

        # Generator
        self.label_generator = Gtk.Label("Generator: ")
        self.grid.attach(self.label_generator, 2, 3, 1, 2)
        self.entry_generator = Gtk.Entry()
        self.grid.attach(self.entry_generator, 3, 3, 1, 2)

        # Cipher Text
        self.label_cipher = Gtk.Label("Cipher Text: ")
        self.grid.attach(self.label_cipher, 4, 3, 1, 2)
        self.entry_cipher = Gtk.Entry()
        self.grid.attach(self.entry_cipher, 5, 3, 1, 2)

        # Title 2
        self.label_title2 = Gtk.Label(
            "Please provide Alice's public key and Bob's private key"
        )
        self.grid.attach(self.label_title2, 0, 5, 10, 2)

        # Alice public key
        self.label_alice = Gtk.Label("Public Key: ")
        self.grid.attach(self.label_alice, 0, 7, 1, 2)
        self.entry_alice = Gtk.Entry()
        self.grid.attach(self.entry_alice, 1, 7, 1, 2)

        # Bob private key
        self.label_bob = Gtk.Label("Private Key: ")
        self.grid.attach(self.label_bob, 2, 7, 1, 2)
        self.entry_bob = Gtk.Entry()
        self.grid.attach(self.entry_bob, 3, 7, 1, 2)

        # Button Decrypt
        self.button_decrypt = Gtk.Button(label="Decrypt")
        self.button_decrypt.connect("clicked", self.main)
        self.grid.attach(self.button_decrypt, 4, 7, 2, 2)

    def main(self, widget):
        function = elGamal_func.Function()
        try:
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
            B, ss, x, y = function.compute(p, g, c1, A, b)
            # B = 2334
            # ss = 4459
            # x = 9484
            # y =  8737
        except ValueError as e:
          # Dialog Box
            dialog = Gtk.MessageDialog(
                self,
                0,
                Gtk.MessageType.ERROR,
                Gtk.ButtonsType.CLOSE,
                "Please enter all fields"
            )
            dialog.run()
            print(e)
            dialog.destroy()
        except Exception as e:
            dialog = Gtk.MessageDialog(
                self,
                0,
                Gtk.MessageType.ERROR,
                Gtk.ButtonsType.CLOSE,
                "Error, please try again with different numbers"
            )
            dialog.run()
            print(e)
            dialog.destroy()
        else:
            result = "Bob's public key is: " + \
                str(B) + "\n" + "Shared secret is: " + str(ss) + "\n" + "Inverse modular of ss is: " + \
                str(x) + "\n" + "Debit/Credit card's PIN number is: " + str(y)
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
            print(f"The ciphertext decrypted successfully\n{result}")
            dialog.destroy()
        finally:
            print("INFO dialog closed")


if __name__ == "__main__":
    win = MainWindow()
    win.connect("destroy", Gtk.main_quit)
    win.show_all()
    Gtk.main()
