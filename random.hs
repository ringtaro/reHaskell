import System.Random
main = do
  --gen <- getStdGen -- ↓これでOKならgetStdGenいらなくね？
  gen <- newStdGen
  putStrLn $ take 20 (randomRs ('a','z') gen)
  --gen' <- getStdGen -- getStdGenを続けると同じ乱数が発生する
  gen' <- newStdGen
  putStrLn $ take 20 (randomRs ('a','z') gen')
  gen'' <- newStdGen
  putStrLn $ take 20 (randomRs ('a','z') gen'')
