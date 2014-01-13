import Control.Concurrent (threadDelay)
import Control.Monad (forM_)

wait :: IO ()
wait = threadDelay 100000

cr :: IO ()
cr = putStr "\r"

faces :: [String]
faces = ["( ´･_･)", "(  ´･_)", "(   ´･)", "(    ´)", "(     )", "(`    )", "(･`   )", "(_･`  )", "(･_･` )", "(´･_･`)"]

main :: IO ()
main = do
  forM_ (concat $ replicate 3 faces) $ \f -> do
    putStr f
    wait
    cr
  putStrLn ""
