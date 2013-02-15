import qualified Data.Map as M
import qualified Data.List as L

-- Bars to be plotted
type HistBars = M.Map Float Int

-- Draw one bar given the center and the count

-- Compose the overall histogram.
--hist :: Float -> Float -> [Float] -> [(Float, Int)]
--hist minBin binWidth dataColumn = concat $ intersperse "\n" $ map writeBar counts minBin binWidth dataColumn

-- Count and round.
counts :: Float -> Float -> [Float] -> [(Float, Int)]
counts minBin binWidth dataColumn = take nBins $ map (\b -> (b + (fromIntegral $ binHeight b) / 2, binHeight b)) bins
  where
    nBins = ceiling $ ((maximum dataColumn) - minBin) / binWidth
    bins = take nBins $ L.unfoldr (\x -> Just (x, x + binWidth)) minBin
    binHeight binLeft = length $ filter (\x -> x >= binLeft && x < (binLeft + binWidth)) dataColumn

main = do
  putStrLn $ show $ counts 23 4 $ map (* 1.1) [26..50]
