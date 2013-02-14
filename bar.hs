import qualified Data.Map as M
import qualified Data.List as L

-- Bars to be plotted
type Bars = M.Map String Int

highestHeight :: Bars -> Int
highestHeight bars = M.foldl (\a b -> maximum [a, b] ) 0 bars

-- Count for the bars
makeBars :: String -> Bars
makeBars raw = M.map (\x -> round $ x * 80 / divisor) bars
  where
    bars = foldr (\level -> M.insertWith (+) level 1) M.empty $ words raw
    divisor = maximum $ map snd $ M.toList

-- Write one row.
makeBarString :: String -> Int -> String
makeBarString key value = label ++ " " ++ bar
  where
    bar = take value $ repeat '|'
    label = reverse $ take 5 $ reverse $ (take 5 $ repeat ' ') ++ key

makeBarPlot :: Bars -> [String]
makeBarPlot bars = map (\l -> snd l) $ M.toList $ M.mapWithKey makeBarString bars

barplot :: String -> String
barplot raw = (L.intercalate "\n" $ makeBarPlot $ makeBars raw) ++ "\n"

main = interact barplot
