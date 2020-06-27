mySeq :: Int -> Int 
mySeq n 
      | cond      = (n-1)*(n-1) + 3
      | otherwise = 0
    where 
      cond = n `mod` 2 == 0


firstN :: Int -> [Int] 
firstN n = [ mySeq i | i <- [1..n] ]