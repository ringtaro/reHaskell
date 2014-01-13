import Control.Concurrent (threadDelay)
import Data.List (intersperse)

wait :: IO ()
wait = threadDelay 100000

cr :: IO ()
cr = putStr "\r"

faces :: [String]
faces = ["( ´･_･)", "(  ´･_)", "(   ´･)", "(    ´)", "(     )", "(`    )", "(･`   )", "(_･`  )", "(･_･` )", "(´･_･`)"]

main :: IO ()
main = do
  sequence_ $ intersperse (wait >> cr) $ concat $ replicate 3 $ map putStr faces
  putStrLn ""
