module Pizza where

import qualified Data.Map as Map

main :: IO ()
main = do
  putStrLn "What is the size of pizza 1"
  s1 <- getLine
  -- let s1 = read size1 :: Double
  putStrLn "Cost of pizza 1"
  c1 <- getLine
  putStrLn "size pizza2"
  s2 <- getLine
  putStrLn "cost pizza 2"
  c2 <- getLine
  let p =
        comparePizzas
          (read s1 :: Double, read c1 :: Double)
          (read s2 :: Double, read c2 :: Double)
  putStrLn $ describePizza p

areaGivenDiameter :: Double -> Double
areaGivenDiameter size = pi * (size / 2) ^ 2

type Pizza = (Double, Double)

costPerInch :: Pizza -> Double
costPerInch (size, cost) = cost / areaGivenDiameter size

comparePizzas :: Pizza -> Pizza -> Pizza
comparePizzas p1 p2 =
  if costP1 < costP2
    then p1
    else p2
  where
    costP1 = costPerInch p1
    costP2 = costPerInch p2

describePizza :: Pizza -> String
describePizza (size, cost) =
  "The " ++
  show size ++
  " pizza " ++ "is cheaper at " ++ show costSqInch ++ " per square inch"
  where
    costSqInch = costPerInch (size, cost)

costData :: Map.Map Int Double
costData = Map.fromList [(1, 18.0), (2, 16.0)]
