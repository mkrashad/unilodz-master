{-- 1) (0–4 p.)
a) Define the sequence (an)n=1,2,... such that an = 2(n n 1)2 when n is divisible by 3, and an = 1 in other cases.
b) Define a function that for an argument n creates the list of n initial numbers of the sequence (an)n=1,2,... --}

--a)
mySeq :: Int -> Int 
mySeq n 
      | cond      = 2*(n-1)*(n-1)
      | otherwise = 1
    where 
      cond = n `mod` 3 == 0

--b)
firstN :: Int -> [Int] 
firstN n = [ mySeq i | i <- [1..n] ]

{-- 2) (0–4 p.) Define a function that for a list of numbers, given as an argument, creates a list of elements of given list
multiplied by 5. --}

--Non-recursive
list5::[Int] -> [Int]
list5 [] = []
list5 xs = [ x*5 | x <- xs]

--Recursive 
list5'::[Int] -> [Int]
list5' [] = []
list5' (x:xs) = x*5 : list5' xs

{-- 3) (0–4 p.) Define a recursive function which removes empty sub-lists from the list of lists.
-- Example: for the list [[2,9],[],[5,6,7],[],[0]] we obtain [[2,9],[5,6,7],[0]]. NOTE - elements of sub-lists do not have to be
numbers. --}
rmEmpty :: (Eq a) => [[a]] -> [[a]]
rmEmpty [] = [] 
rmEmpty (x:xs) 
          | x == []   = rmEmpty xs
          | otherwise = x : rmEmpty xs

{-- 4) (0–4 p.) Define a function that reads 2 real numbers given by an user and then displays the arithmetic mean of these
numbers. Display instructions for an user. --}
main = do
 putStr "Write first number = " 
 x <- getLine
 putStr "Write second number = "
 y <- getLine
 putStrLn("Mean of x and y = "  ++ (show  (((read x ::Double) + (read y::Double)) /2)))