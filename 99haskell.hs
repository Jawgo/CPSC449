--1
myLast :: [a] -> a
myLast [x] = x
myLast (_:xs) = myLast xs

--2
myButLast :: [a] -> a
myButLast = last . init

--3
elementAt :: [a] -> Int -> a
elementAt [] _ = error "empty list :("
elementAt (x:_) 1 = x
elementAt (x:xs) num = elementAt xs (num - 1)

--4
myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

--5
myReverse :: [a] -> [a]
myReverse [] = []
myReverse [x] = [x]
myReverse x = reverse x

--6
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome xs
    | head xs == last xs = isPalindrome (reverse( tail( reverse( tail xs))))
    | otherwise = False

--7 SKIP

--8 
compress ::(Eq a) => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:y:xs)
    | x == y = compress (x:xs)
    | otherwise  = x : compress (y:xs)

--9
pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack (x:xs) = let (first, rest) = span (==x) xs
            in (x:first) : pack rest


--10 skip
encode :: Eq a => [a] -> [(Int, a)]
encode = map (\x -> (length x, head x)) . pack 

--11skip
--12
--13
--14
dupli :: [a] -> [a]
dupli [] = []
dupli (x:xs) = (x:x:(dupli xs))

--15
repli :: [a] -> Int -> [a]
repli [] _ = []
repli (x:xs) 0 = (x:xs)
repli (x:xs) num = repHelp x num ++ repli xs num

repHelp :: a -> Int -> [a]
repHelp _ 0 = []
repHelp x num = (x : (repHelp x (num -1)))

--16
dropEvery :: [a] -> Int -> [a]
dropEvery [] _ = []
dropEvery (x:xs) 0 = (x:xs)
dropEvery (x:xs) num = dropHelp (x:xs) 1 num 

dropHelp :: [a] -> Int -> Int -> [a]
dropHelp [] _ _ = []
dropHelp (x:xs) start num
    | start `mod` num == 0 = dropHelp xs (start + 1) num
    | otherwise = (x : (dropHelp xs (start + 1) num))

--17
split :: [a] -> Int -> ([a],[a])
split [] _ = ([],[])
split (x:xs) num
    | num > 0 = (x: ys, zs)
    | otherwise = ([], (x:xs))
    where (ys, zs) = split xs (num-1)

--18
slice :: [a] -> Int -> Int -> [a]
slice [] _ _ = []
slice xs start end
    | start > 1 = slice (tail xs) (start -1) (end -1)
    | start == 1 && end > 1 = slice (reverse(tail (reverse xs))) start (end -1)
    | start == 1 && end == 1 = xs

--19 
rotate :: [a] -> Int -> [a]
rotate [] _ = []
rotate (x:xs) num
    | num > 0 = rotate (xs ++ [x]) (num -1)
    | num == 0 = (x:xs)
    | num < 0 = rotate ([last xs] ++ ys) (num + 1)
    where ys = take (length xs) (x:xs)

--20
removeAt :: Int -> [a] -> (a,[a])
removeAt num (x:xs)
    | num > 1 = (l, x:r)
    | otherwise = (x, xs)
    where (l, r) = removeAt (num-1) xs









































 
