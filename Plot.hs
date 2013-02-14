import qualified Data.Map as Map

-- Bars to be plotted
type Bars = Map.Map String Int

-- An example
sepalLengthBars :: Bars
sepalLengthBars = Map.fromList [("4", 5), ("5", 47), ("6", 68), ("7", 24), ("8", 6)]

makeBar :: String -> Int -> String
--makeBar key value = key ++ " " ++ take value $ repeat '='
makeBar key value = take value $ repeat '='

--makeBarPlot :: Bars -> [String]
--makeBarPlot bars = Map.mapWithKey makeBar bars

main = do
--putStrLn $ show $ makeBarPlot sepalLengthBars
  putStrLn $ makeBar "aoeu" 8
