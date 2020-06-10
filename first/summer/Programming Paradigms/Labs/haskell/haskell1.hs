-- Ex. 1.
-- =======
-- Define a function named hello, which called with a String argument, will print a welcome text on the screen using this argument, e.g.

-- hello "Marek"

-- gives us:

-- "Hello Marek!!!"

-- Tip: For concatenation of strings use the operator ++

hello :: String -> String

hello x = "Hello " ++ x


-- Ex. 2.
-- =======
-- Define a function named volume that calculates the volume of a box with sides x, y, z.

volume :: Double -> Double -> Double -> Double

volume x y z = x * y * z

-- Ex. 3.
-- =======
-- a) Define a function the named doubleMe, which multiplies by 2 a number given as an argument. 

doubleMe :: Int -> Int

doubleMe x = x * 2
 
-- b) Define the list of named myNumbers, whose elements are: 11, 12, 13, ..., 99.

myNumbers :: [Int]

myNumbers = [1..99]

-- c) Apply the functions map and doubleMe for the list myNumbers.

doubleList :: [Int]

doubleList = map doubleMe myNumbers

-- d) Define a function named mod13, which will display numbers divisible by 13 from the given list of numbers. Use this function for the list myNumbers.

mod13 :: [Int] -> [Int]

mod13 x = [y | y<-x, y `mod` 13 == 0]


-- Ex. 4.
-- =======
-- Define a function called  initial, which will display the initials of the person (with dots after the first letters of the first and last names) for the entered the first and last names (two strings), e.g.

-- initial "Anna" "Lis"

-- gives us:  "A.L."

initial :: String -> String -> [Char]

initial x y = if x == [] && y == [] then "Please write string" else [head x] ++ "." ++ [head y] ++ "."

-- Ex. 5.
-- =======
-- Define a function called unitaryN, which will build a unit matrix of the given degree. For example, if we apply

-- unitaryN 5

-- we will get on the screen

-- [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]

unitaryN :: Int -> [[Integer]]

unitaryN n = [[if i == j then 1 else 0| i<-[1..n]] | j<-[1..n]]

-- Ex. 6.
-- =======
-- Define the list of three-digit numbers divisible by 3 with different digits (these are, among others, the numbers 102, 105, 459, 987).

divisibleBy3 = [x *100 + y*10 + z| x<-[1..9], y<-[0..9], z<-[0..9], (x+y+z) `mod` 3 == 0, x/=y, y/=z, x/=z]

-- Ex. 7.
-- =======
-- Define a function that prints from the given string:

-- a) only lowercase letters;

-- b) only uppercase letters;

-- c) all characters that are not digits.

lower n = [x | x<-n, x `elem` ['a'..'z']]
upper n  = [x| x<-n, x `elem` ['A'..'Z']]
digit n = [x| x<-n, x `elem` ['0'..'9']]