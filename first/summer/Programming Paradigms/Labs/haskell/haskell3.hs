-- Ex. 1. 
-- =======
-- Define the sequence {c_{n}}, where c_{1}=1, c_{n}=1+2*c_{n-1} for n=2,3,...

-- a) Print c_{15}.

-- b) Create the list of the 15 first elements of the sequence {c_{n}}.

-- c) Define a function that for a given n creates the list of the first n elements of the sequence {c_{n}}.

-- d) Create the list of the elements of the sequence {c_{n}}, which are less then 1000.

c :: Integer -> Integer
c 1 = 1
c n = 1 + 2*c(n-1)

c15 = [c x| x <-[1..15]]

myFunc n = [c x| x <-[1..n]]

myFunc2 = [x | x<- [1..]]

take1000 = takeWhile (<1000) myFunc2

myFunc3 = [c x| x <- [1..], c x<1000]


-- Ex. 2. 
-- =======
-- Define two sequences {a_{n}} and {b_{n}}, where

-- a_{0}=1, a_{n}=a_{n-1}+b_{n-1}, n=1,2,...,

-- b_{0}=1, b_{n}=a_{n-1}*b_{n-1},  n=1,2,...

-- Create two lists:
-- - the list of the first 10 elements of the  sequence {a_{n}},
-- - the list of the first 10 elements of the  sequence {b_{n}}.


a :: Integer -> Integer
a 0 = 1
a n = a(n-1) + b(n-1)

b :: Integer -> Integer
b 0 = 1
b n = a (n-1) * b (n-1)

listA = [a x | x<-[1..10]]
listB = [b x | x<-[1..10]]


-- Ex. 3.
-- ======
-- Define functions:
-- firstFromList :: [a] -> a
-- secondFromList :: [a] -> a
-- lastFromList :: [a] -> a
-- prelastFromList :: [a] -> a
-- that give, respectively, the first, second, last and one before last elements of a list.

firstFromList :: [a] -> a
firstFromList [] = error "Empty list"
firstFromList (x:_) = x

secondFromList :: [a] -> a
secondFromList [] = error "Empty list"
secondFromList [_] = error "List has one element"
secondFromList(_:x:_) = x 

lastFromList :: [a] -> a
lastFromList [] = error "Empty list"
lastFromList [x] = x 
lastFromList (_:xs) = lastFromList xs

prelastFromList :: [a] -> a
prelastFromList [] = error "Empty list!"
prelastFromList [_] = error "The list has one element"
prelastFromList [x,_] = x 
prelastFromList (_:xs) = prelastFromList x


{--Ex. 4.
=======
Define a function

mergeLists :: [[a]] -> [a]

which returns the combined list of lists of any elements. For example:

mergeLists [[1,2,3],[4,8],[9]]

returns the list [1,2,3,4,8,9].
--}

mergeLists :: [[a]] -> [a]
mergeLists n =  concat n


mergeLists' :: [[a]] -> [a]
mergeLists' [] = []
mergeLists' (x:xs) = x ++ mergeLists' xs


{--Ex. 5.
=======
Define a function

howManyTimes :: a -> [a] -> Int	

which returns a number representing the number of times an element is on a list.

For example:
howManyTimes 'a' "bananas" 

returns the number 3.
--}

howManyTimes :: (Eq a) => a -> [a] -> Int
howManyTimes _ [] = 0
howManyTimes y (x:xs) = (if (y == x) then 1 else 0) + howManyTimes y xs


howManyTimes' :: (Eq a) =>  a -> [a] -> Int
howManyTimes' x y = (length . filter (== x)) y  



-- Define a function
-- connectOneAfterOne :: [a] -> [a] -> [a]
-- which returns the list of elements taken from two lists (given as arguments) and the elements are taken one by one in the order of indexes.
-- For example:
-- connectOneAfterOne [1,2,3] [6,7,8,9,10]
-- returns the list [1,6,2,7,3,8].


connectOneAfterOne :: [a] -> [a] -> [a]
connectOneAfterOne [] x = []
connectOneAfterOne x [] = []
connectOneAfterOne (x:xs) (y:ys) = x:y:connectOneAfterOne xs ys
