import qualified Data.Map as M
import qualified Data.List as L

-- Bars to be plotted
type Bars = M.Map String Int

-- An example
sepalLengthBars' :: Bars
sepalLengthBars' = M.fromList [("4", 5), ("5", 47), ("6", 68), ("7", 24), ("8", 6)]

sepalLengthRaw :: String
sepalLengthRaw = "4 4 4 4 5 5 5 5 6 7 8 7 9 6 6 5 4\n3    5 5 5 5 5 5 5"

makeBars :: String -> Bars
makeBars raw = foldr (\level -> M.insertWith (+) level 1) M.empty $ words raw

sepalLengthBars = makeBars sepalLengthRaw

makeBar :: String -> Int -> String
makeBar key value = label ++ " " ++ bar
  where
    bar = take value $ repeat '|'
    label = reverse $ take 5 $ reverse $ (take 5 $ repeat ' ') ++ key

makeBarPlot :: Bars -> [String]
makeBarPlot bars = map (\l -> snd l) $ M.toList $ M.mapWithKey makeBar bars

barplot :: String -> String
barplot raw = (L.intercalate "\n" $ makeBarPlot $ makeBars raw) ++ "\n"

--makeHistBars :: String -> Bars
--makeHistBars raw = map (\key -> M.insertWith (+) key 0) bars
--  where
--    bars = foldr (\level -> M.insertWith (+) level 1) M.empty $ map (\w -> read w :: Int) words raw

--hist :: String -> String
--hist raw = (L.intercalate "\n" $ makeBarPlot $ makeHistBars raw) ++ "\n"

--main = interact main'
main = do
  putStrLn $ barplot "8 7 3 2 3 2 3 2 8"
