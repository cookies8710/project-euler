-- vyfiltrovat cisla <10000 na ty, ktere neobsahuji 0 a ve kterych se neopakuji cifry (72 dvoucif, 504 trojcif, 3024 ctyrcif ?)
-- zkouset dvoucif * trojcif a hledat vysledek ve ctyrcif, behem toho kontrolovat pandigit; pak jeste jendocif * ctyrcif

import Data.Char
import Data.List

dnrh [] _ = True
dnrh (x:xs) prev = if (x == prev) then False else dnrh xs x
dnr n = dnrh (sort $ map digitToInt $ show n) 0

dnr2d = filter dnr [10..99]
dnr3d = filter dnr [100..999]
dnr4d = filter dnr [1000..9999]

dnrtuple (a, b) = dnrh (sort $ map digitToInt $ (++) (show a) (show b)) 0
pandigittriplet (a, b, c) = digits == [1..9] && dnrh digits 0 where digits = sort $ map digitToInt $ foldl (++) [] [show a, show b, show c]

solutionPart l r = [(a, b, a*b)|a<-l, b<-r, dnrtuple (a,b), pandigittriplet (a, b, a*b)]
solution = sum $ map head $ group $ sort $ map (\(_, _, a) -> a) $ (solutionPart dnr2d dnr3d) ++ (solutionPart [2..9] dnr4d)