import qualified Data.List as L
import qualified Text.Printf as P

type Count = (Float, Int)

-- Draw one bar given the center and the count
writeBar :: Count -> String
writeBar count = (P.printf ("%." ++ resolution ++ "f") x) ++ ( take c $ repeat '=' )
  where
    (x,c) = count
    resolution = maximum [0, 0 - (fromIntegral round $ log x)]

-- Compose the overall histogram.
hist :: Float -> Float -> [Float] -> String
hist minBin binWidth dataColumn = concat $ L.intersperse "\n" $ map writeBar $ counts minBin binWidth dataColumn

-- Count and round.
counts :: Float -> Float -> [Float] -> [Count]
counts minBin binWidth dataColumn = take nBins $ map (\b -> (b + (fromIntegral $ binHeight b) / 2, binHeight b)) bins
  where
    nBins = ceiling $ ((maximum dataColumn) - minBin) / binWidth
    bins = take nBins $ L.unfoldr (\x -> Just (x, x + binWidth)) minBin
    binHeight binLeft = length $ filter (\x -> x >= binLeft && x < (binLeft + binWidth)) dataColumn

main = do
  putStrLn $ show $ counts 23 4 $ map (* 1.1) [26..50]
  putStrLn $ hist 23 4 $ map (* 1.1) [26..50] ++ [70..80]
