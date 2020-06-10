-- Ex. 1. 
-- =======
-- Define a function
-- sumPositiveOnList :: [Int] -> Int
-- which calculates the sum of positive numbers from a list given as an argument.

sumPositiveOnList :: [Int] -> Int

sumPositiveOnList [] = error "Empty list"
sumPositiveOnList [x] = x
sumPositiveOnList (x:xs) = x + sumPositiveOnList xs

sumPositiveOnList' :: [Int] -> Int
sumPositiveOnList' [] = 0
sumPositiveOnList' (x:xs) = (if (x>0) then x else 0 ) + sumPositiveOnList xs

-- Ex. 2. 
-- =======
-- Define a function
-- count :: Num p => (t -> Bool) -> [t] -> p
-- which calculates how many elements of the list satisfy the given logical condition.
-- For example:
-- count (<2) [3,1,0,3,2,1]						gives 3, 
-- count (==3) [3,1,0,3,2,1]						gives 2,
-- count (=='a') "Ala ma kota, a Ola psa"			gives 6.

count :: Num p => (t -> Bool) -> [t] -> p

count _ [] = 0
count y (x:xs)  = (if y x == True then 1 else 0) + count y xs


-- Ex. 3. 
-- =======
-- Define a function, which reads 2 numbers given by the user and then calculates and displays their sum and difference.

-- myFunc :: a -> b -> a -> b

main = do
 putStr "x = " 
 x <- getLine
 putStr "y = "
 y <- getLine
 putStrLn("a + b= "  ++ (show  ((read x ::Double) + (read y::Double))))
 putStrLn("a - b= "  ++ (show  ((read x ::Double) - (read y::Double))))

-- Ex. 4. 
-- =======
-- Define a function, which reads a given string s and a natural number n and then displays on the screen n times the string s. If an user gives a negative n, the function will display the message "Invalid value n".

sNTimes = do
  putStr "Enter your string: "
  s <- getLine
  putStr "How many times? n= "
  n <- getLine
  putStrLn (myFunc s (read n ::Int))

myFunc s n 
 | n < 0 = error "Invalid value n"
 | n == 0 = ""
 | otherwise = s ++ myFunc s(n-1)
	
	