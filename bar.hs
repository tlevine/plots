import qualified Data.Map as M
import qualified Data.List as L

-- Bars to be plotted
type Bars = M.Map String Int

makeBar :: String -> Int -> String
makeBar key value = label ++ " " ++ bar
  where
    bar = take value $ repeat '|'
    label = reverse $ take 5 $ reverse $ (take 5 $ repeat ' ') ++ key

makeBarPlot :: Bars -> [String]
makeBarPlot bars = map (\l -> snd l) $ M.toList $ M.mapWithKey makeBar bars

makeBars :: String -> Bars
makeBars raw = foldr (\level -> M.insertWith (+) level 1) M.empty $ words raw

barplot :: String -> String
barplot raw = (L.intercalate "\n" $ makeBarPlot $ makeBars raw) ++ "\n"

main = interact barplot
