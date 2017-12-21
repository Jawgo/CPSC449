import Data.Char
-- Final Practice questions
okPassword :: String -> Bool
okPassword pw
    | lenPw pw && upPw pw && lowPw pw && digPw pw = True
    | otherwise = False

lenPw :: String -> Bool
lenPw pw = length pw > 7


upPw :: String -> Bool
upPw [] = False
upPw (x:xs)
    | ord x >= 65 && ord x <= 90 = True
    | otherwise = upPw xs 
    
lowPw :: String -> Bool
lowPw [] = False
lowPw (x:xs)
    | ord x >= 97 && ord x <= 122 = True
    | otherwise = lowPw xs 

digPw :: String -> Bool
digPw [] = False
digPw (x:xs)
    | ord x >= 48 && ord x <= 57 = True
    | otherwise = digPw xs 

    -- OTHER SOLUTION
--okPassword :: String -> Bool
--okPassword p = length p >= 8 &&
  --               length (filter (\x -> 'A' <= x && x <= 'Z') p) > 0 &&
    --             length (filter (\x -> 'a' <= x && x <= 'z') p) > 0 &&
      --           length (filter (\x -> '0' <= x && x <= '9') p) > 0
    
-- Number 2
-- Return # of positive ints, number of zeros, negative numbers
pzn :: [Int] -> (Int, Int, Int)
pzn list = foldl helpPzn (0,0,0) list

helpPzn :: (Int, Int, Int) -> Int -> (Int, Int, Int)
helpPzn (f, s, t) x
    | x > 0 = (f+1, s, t)
    | x < 0 = (f, s, t+1)
    | otherwise = (f, s+1, t)
    
 -- Number 3
closest :: (Ord a, Num a) => a -> [a] -> a
closest num [] = error "empty list"
closest num (x:[]) = x
closest num (x:y:xs)
    | num <= x =  x
    | num > x && num < y && (num - x) < (y - num) = x
    | num > x && num < y = y
    | otherwise = closest y xs
    
-- question 4
data TernaryTree = Internal String TernaryTree TernaryTree TernaryTree |
                    Leaf String deriving Show

countNodes :: TernaryTree -> (Int, Int)
countNodes (Leaf _) = (0,1)
countNodes (Internal _ left mid right) = (1 + fst ltt + fst mtt+ fst rtt, snd ltt + snd mtt + snd rtt)
    where
    ltt = countNodes left
    mtt = countNodes mid
    rtt = countNodes right
    
-- question 5
random_list :: Int -> [Int]
random_list seed = [(next_seed - 1) `mod` 10 + 1] ++ random_list next_seed
    where
    next_seed = 7*seed `mod` 101