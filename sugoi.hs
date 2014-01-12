-- リスト内包表記の例
rightTriangles =
  [ (a,b,c) | c <- [2..100], a <- [1..c-1], b <- [1..a-1], a^2 + b^2 == c^2]

-- asパターンの例：allで全体、x，xsで一部にアクセスできる
firstLetter :: String -> String
firstLetter "" = error "Empty string, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- whereのパターンマッチ
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where 
  	(f:_) = firstname
  	(l:_) = lastname

-- whereもletもローカルスコープを作るが、whereは式でwhereは節でletは式。
-- 式は値を返す。
letSample =
  do
    print [let square x = x * x in (square 5, square 3, square 2)]
    print ((let (a, b, c) = (1, 2, 3) in a * b * c) * 100, let foo = "Hey "; bar = "there!" in foo ++ bar)

-- リスト内包表記でのlet
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi | (w,h) <- xs, let bmi = w / h^2]

-- case文の例
describeList :: [a] -> String
describeList ls =
  "The list is " ++
  case ls of
    [] -> "empty."
    [x] -> "a singleton list."
    xs -> "a longer list."

data TrafficLight = Red | Yellow | Green 
instance Eq TrafficLight where
  Red == Red = True
  Yellow == Yellow = True
  Green == Green = True
  _ == _ = False
instance Show TrafficLight where
  show Red = "Red Light"
  show Yellow = "Yellow Light"
  show Green = "Green Light"
  
class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True


instance YesNo [a] where
  yesno [] = False
  yesno _ = True

instance YesNo Bool where
  yesno = id

instance YesNo (Maybe a) where
  yesno (Just _) = True
  yesno Nothing = False

--instance YesNo (Tree a) where
--  yesno EmptyTree = False
--  yesno _ = True

instance YesNo TrafficLight where
  yesno Red = False
  yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult =
  if yesno yesnoVal
    then yesResult
    else noResult
