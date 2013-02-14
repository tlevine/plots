import qualified Data.Map as M
import qualified Data.List as L

-- Bars to be plotted
type Bars = M.Map String Int

makeBars :: String -> Bars
makeBars raw = foldr (\level -> M.insertWith (+) level 1) M.empty $ words raw

makeBar :: String -> Int -> String
makeBar key value = label ++ " " ++ bar
  where
    bar = take value $ repeat '|'
    label = reverse $ take 5 $ reverse $ (take 5 $ repeat ' ') ++ key

makeBarPlot :: Bars -> [String]
makeBarPlot bars = map (\l -> snd l) $ M.toList $ M.mapWithKey makeBar bars

makeHistBars :: String -> Bars
makeHistBars raw = foldr (\level -> M.insertWith (+) (show level) 0) bars [(minimum levels)..(maximum levels)]
  where
    bars = makeBars raw
    levels = map (\x -> read x :: Int) $ M.keys bars

barplot :: String -> String
barplot raw = (L.intercalate "\n" $ makeBarPlot $ makeBars raw) ++ "\n"

hist :: String -> String
hist raw = (L.intercalate "\n" $ makeBarPlot $ makeHistBars raw) ++ "\n"

--main = interact main'
main = do
  putStrLn $ barplot "8 7 3 2 3 2 3 2 8"
  putStrLn $ hist "8 7 3 2 3 2 3 2 8"
  putStrLn $ show $ makeHistBars "8 7 3 2 3 2 3 2 8"
