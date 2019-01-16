-- problem 49:
-- najit trojice 4-cifernych prvocisel, jejichz cifry jsou navzajem permutace a rozdily mezi prvnim a druhy a druhym a tretim (pri serazeni dle velikosti) jsou stejne

-- idea: roztridit podle permutaci, pak mezi nimi hledat trojice

-- ANSWER: 2969, 6299, 9629

import Data.List
import Data.Tuple
import Data.Ord

--checkprime list n = fst $ orderedlistsearchmain2 list fst n 
sievestep :: Integral b => [(b, Bool)] -> b -> [(b, Bool)]
sievestep list n = 
	if(snd $ head $ filter (\x -> fst x == n) list) then
		map (\x -> (fst x, ((snd x && mod (fst x) n /= 0)||fst x == n))) list 
	else
		list

sievestep2 :: Integral b => [(b, Bool)] -> b -> [(b, Bool)]
sievestep2 l 2 = sievestep l 2
sievestep2 l n = sievestep2 (sievestep l (n-1)) (n-1)

onlytruenumbers :: Integral b => [(b, Bool)] -> [b]
onlytruenumbers l = map fst $ filter snd l

applysieve :: Integral b => [(b, Bool)] -> [(b, Bool)]
applysieve list = sievestep2 list (ceiling $ sqrt $ fromIntegral $ fst $ last list)

findPrimesTo :: Integral a => a -> [a]
findPrimesTo n = onlytruenumbers $ applysieve [(x, x>1)|x<-[0..n]]

fourDigitPrimes = filter (\x -> x > 1000) $ findPrimesTo 10000

maxOrder10 :: Integral a => a -> a
maxOrder10 n = floor $ (/) (log $ fromIntegral n) (log 10)

getOrderedDigits n = sort $ map (\x -> mod (div n (10^x)) 10) [0..mo] where mo = (maxOrder10 n)

--sortByPerms :: Integral a => [a] -> [([a], [a])]
uniquesPart :: (a -> a -> Bool) -> [a] -> a -> [a]
uniquesPart _ [] _ = []
uniquesPart cmpfunc (x:xs) prev = if cmpfunc x prev then rest else x:rest where rest = uniquesPart cmpfunc xs x
uniques cmpfunc start l = uniquesPart cmpfunc l start
zipped l = zip l $ map getOrderedDigits l

getNumsByPerm perm l = filter (\(_, b) -> perm == b) l
sortByPerms l@(x:xs) = let uperms = uniques (==) [] $ map (\(_, b) -> b) $ sortBy (comparing snd) $ zipped l in 
	map (\perm -> filter (\(n, p) -> p == perm) $ zipped l) uperms

-- cisla zgrupovane podle svych permutaci, bez grup obsahujici mene nez 3 cisla
groupByPerms l = filter (\ns -> (<) 2 $ length ns) $ map (map (\(n, _) -> n)) $ sortByPerms l

getTriplets l = let len = length l; m = len - 1 in if (len < 3) then [] else [(l!!a, l!!b, l!!c)|a<-[0..m], b<-[0..m], c<-[0..m], a < b, b < c]

getSolution = filter (/= []) $ -- vyhod prazdne grupy
	map (filter (\(a,b,c) -> b-a == c-b)) $ -- z kazde grupy vyhod trojice, ktere nesplnuji podminku, ze rozdil mezi prvnim a druhym je stejny jako mezi druhym a tretim
	map getTriplets $ -- pro kazdou grupu vygeneruj trojice
	groupByPerms fourDigitPrimes -- zgrupuj ctyrciferne prvocisla podle permutaci jejich cifer