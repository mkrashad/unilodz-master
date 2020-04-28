-- Ex. 1. 
-- =======
-- Define a function named charN, which for a natural number n and a string s gives the nth character of the string s.

charN :: Int -> String -> Char
charN n s = s !! (n-1)

-- Ex. 2. 
-- =======
-- Define two lists: listA, listB;
-- listA is a list of 6 ordered pairs of strings - names and surnames of certain people;
-- listB consists of two-digit numbers with the digits of tens 3, 5 or 7 and the digits of unity 3 or 4.
-- a) Define the list named listA1 consisting only of the names from the list listA.
-- b) Define the list named listA2 consisting only of the surnames from the list listA.
-- c) Define the list named people - the list of  triples of all possible systems (name, surname, age), where the age is from listB.

listA = [("John", "Doe"), ("Steve", "Smith"), ("Rashad","Mahmudov"),("Forest","Gump"), ("Harry", "Potter"),("Walter","White")]
listB = [x*10+y| x<-[3,5,7], y<-[3,4]]
people = zip listA listB

listA1 = fst (unzip listA)
listA2 = snd (unzip listA)

listA1' = map fst listA
listA2' = map snd listA


-- Ex. 3. 
-- =======

-- Define a function

-- isPrime :: Int -> Bool

-- which returns True if a number given as an argument is  prime, otherwise - False.

-- Then define a function

-- nPrimes :: Int -> [Int]

-- which for a given n returns the list of the n first prime numbers.

-- For example:

-- nPrimes 8

-- returns [2,3,5,7,11,13,17,19].

primeNum :: Int -> [Int]
primeNum n = [x | x<-[1..n], n `mod` x == 0]

isPrime :: Int -> Bool
isPrime n = primeNum n == [1,n]

primes :: [Int] 
primes = [x | x<-[2..], isPrime x == True]

nPrimes :: Int -> [Int]
nPrimes n = take n primes

-- Ex. 4.
-- ======
-- Define a function called pair, which for two lists of numbers will create a pair, the first element of which is the first element of the first list, and the second - the last element of the second list. In the case when any of the lists is empty as a result we obtain the pair (0,0).

pair [] _ = (0,0)
pair  _ [] = (0,0)
pair x y = (head x, last y)

--Ex. 5.
-- =======
-- Define a function called sign, which for the positive number has the value 1, for the negative number it has the value -1 and for the number 0 it has the value 0.
-- a) Use the instruction if ... else ...
-- b) Use guards.
-- 

sign n = if n > 0 then 1 else if n < 0 then - 1 else 0

sign' n
  | n > 0 = 1
  | n < 0 = -1
  | otherwise = 0


--Ex. 6.
-- =======
-- Define a function that calculates the surface area of a cuboid grid with edges of lengths x, y, z, calculating in the intermediate steps the base field and the side wall fields.
-- a) Use the where construction.
-- b) Use the let ... in ... construction.
--


area x y z = 2*(pp+pb1+pb2)
  where
  pp=x*y
  pb1=y*z
  pb2=x*z
  

area' x y z =
   let pp=x*y
       pb1=y*z
       pb2=x*z
   in 2*(pp+pb1+pb2)

