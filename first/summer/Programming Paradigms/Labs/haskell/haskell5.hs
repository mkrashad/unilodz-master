import System.IO

readFromFile = do
	theFile2 <- openFile "test.txt" ReadMode
	contents <- hGetContents theFile2
	putStr contents
	hClose theFile2



import System.IO       -- module import to work with IO operations
import Data.List       -- module import with functions for lists
import Data.Char       -- module import with functions for characters
import System.Random   -- module import with random generators

{--Ex. 1. 
=======
Write a program (or a function) that displays on the screen the contents of a file.
--}

myFile = do
   handle <-  openFile "C:\\Users\\Anna\\Documents\\Paradygmaty\\Haskell2_pl.txt" ReadMode --opening the file for reading, associated with the name handle, you can use a different own name
   contents <- hGetContents handle  --get content from handle, name contents can be replaced with your own name
   putStrLn contents  --printing content from contents
   hClose handle  --closing the file

{--Ex. 2. 
=======
Write a program that writes to a file any text given by an user.
--}

saveText = do
  handle <-  openFile "C:\\Users\\Anna\\Desktop\\tekst.txt" WriteMode --opening the file for writing, associated with the name handle, you can use a different own name
  tekst <- getLine  --reading single-line text, Enter completes entering text
--tekst <- getContents  -- if we want to read multiple lines using Enter at the end of the line, at the end of the text input we enter Ctrl + Z
  hPutStrLn  handle tekst -- save the text in the file associated with the  name handle
  hClose handle  --closing the file

{--Ex. 3. 
=======
Write a program (or a function) that loads the contents of a text file and then saves the downloaded lines in a new file in the reverse order. The file names are expected to be relevant function arguments.
--}

fileToFile file1 file2 = do 
   contents <- readFile file1
   writeFile file2 (unlines . reverse . lines $ contents)
   
-- NOTE: the names of files (with paths) are given between quotation marks, e.g..
-- fileToFile "C:\\Users\\Anna\\Desktop\\aa.txt" "C:\\Users\\Anna\\Desktop\\bb.txt"

--the function lines converts the text to a list of his lines, revers - reverses the list, unlines - a list of strings - lines converts to text composed of these lines
-- the character . denotes a composition of functions
-- the $ character was used to "cut" the function comosition from the argument
-- instead of writing (unlines . reverse . lines $ contents) parentheses can be used accordingly (unlines (reverse (lines contents)))

{--Ex. 4. 
=======
Write a program that reads the contents of a file and then displays:
a) the number of lines in this file,
b) the number of words in this file,
c) the number of letters in this file,
d) number of characters different from spaces in this file.
--}

myRead = do
   putStrLn "Enter the name of the file"
   plik <- getLine  -- here we give the file name (with path) without quotation marks
   readLines plik
   readWords plik
   readChar plik

-- readLines, readWords, readChar function definitions are below

readLines :: String -> IO ()
readLines fileName = do
   handle <- openFile fileName ReadMode
   contents <- hGetContents handle
   let number = length $ lines contents
   putStrLn $ "Number of lines = " ++ show number
   hClose handle

readWords :: String -> IO ()
readWords fileName = do
   handle <- openFile fileName ReadMode
   contents <- hGetContents handle
   let number = length $ words contents  -- the function words converts the text to a list of words
   putStrLn $ "Number of words = " ++show number
   hClose handle

readChar :: String -> IO ()
readChar fileName = do
   handle <- openFile fileName ReadMode
   contents <- hGetContents handle
   let number = length $ filter isAlpha contents
   putStrLn $ "Number of letters = " ++show number
   let number = length $ filter (/=' ') contents
   putStrLn $ "number of characters different from spaces = " ++show number
   hClose handle

{--Ex. 5. 
=======
Write a program (or function) that, after reading a natural number n, displays the list of  n initial numbers of the Fibonacci sequence.
--}

fibo = do 
  putStrLn "Type a number"
  n <- getLine
  let n1 = read n :: Int
  if n1>0 then print $ take n1 [fib' i | i <- [1,2..]] else return ()

--Below are two definitions of the Fibonacci sequence

fib :: Int -> Integer 
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fib' :: Int -> Integer
fib' n = fst $ sequence !! n
  where
    sequence = iterate (\(x, y) -> (y, x + y)) (0, 1)

{--Ex. 6. 
=======
Define a function that simulates a three coin toss.
--}

-- zero-one function
coin3 = do  
   gen <- newStdGen  
   putStrLn ( show   (take 3 (randomRs (0, 1) gen :: [Int])))
  
--a little different
  
data Coin = Avers | Revers deriving (Eq, Ord, Show) --we define a new type with two values

fc :: Int -> Coin  --we define the function fc, the values are from the type Coin
fc 0 = Avers
fc 1 = Revers

coin3' = do
    gen <- newStdGen
    putStrLn . show $ map fc (take 3 (randomRs (0, 1) gen :: [Int])) --we map the function fc to the list