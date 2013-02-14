import qualified Data.Map as Map

-- Bars to be plotted
type Bars = Map.Map String Int

-- An example
sepalLengthBars :: Bars
sepalLengthBars = Map.fromList [("4", 5), ("5", 47), ("6", 68), ("7", 24), ("8", 6)]

-- Convert bars to a list of lines
makePlotLines :: Bars -> [String]
makePlotLines bars = [axis] ++ $ reverse $ []
  where
    highestHeight = Map.foldl max 0 bars
    axis = unwords $ Map.keys bars
    -- [1..highestHeight]

-- Make a plot
countPlot :: Int -> Int -> Bars -> String
countPlot height width bars = concat $ makePlotLines bars

-- Default settings
countPlotDefault = countPlot 50 80

main = do
  putStrLn $ countPlotDefault sepalLengthBars
--putStrLn $ bars
