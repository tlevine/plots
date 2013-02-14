import qualified Data.Map as M
import qualified Data.List as L

-- Bars to be plotted
type Bars = M.Map String Int

-- An example
sepalLengthBars :: Bars
sepalLengthBars = M.fromList [("4", 5), ("5", 47), ("6", 68), ("7", 24), ("8", 6)]

makeBar :: String -> Int -> String
makeBar key value = key ++ " " ++ bar
  where
    bar = take value $ repeat '|'

makeBarPlot :: Bars -> [String]
makeBarPlot bars = map (\l -> snd l) $ M.toList $ M.mapWithKey makeBar bars

main = do
  putStrLn $ L.intercalate "\n" $ makeBarPlot sepalLengthBars
--putStrLn $ makeBar "aoeu" 8
