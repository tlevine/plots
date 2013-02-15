import qualified Data.Map as M
import qualified Data.List as L

-- Bars to be plotted
type HistBars = M.Map Rational Int

hist :: Rational -> Int -> [Rational] -> [(Rational, Int)]
hist minBin nBins dataColumn = []

counts :: Rational -> Rational -> [Rational] -> [(Rational, Int)]
counts minBin binWidth dataColumn = take nBins $ map (\b -> (b, binHeight b)) bins
  where
    nBins = ceiling $ ((maximum dataColumn) - minBin) / binWidth
    bins = take nBins $ L.unfoldr (\x -> Just (x, x + binWidth)) minBin
    binHeight binLeft = length $ filter (\x -> x >= binLeft && x < (binLeft + binWidth)) dataColumn


main = do
  putStrLn $ show $ counts 23 4 $ map (* 1.1) [26..50]
