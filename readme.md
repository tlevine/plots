Plots for your shell
=========

## Histograms
Plot a histogram given a file or stdin.

    USAGE: hist [breaks] [file]

Plot a histogram.

    $ echo 1.3 1.2 3.4 4 2.8 3 6.2 | hist 2
    
    4   *
    3   *
    2 * *
    1 * * *
      2 4 6

If you don't specify the breaks, we use my tick algorithm to choose
about eight ticks. It would look like this, except this isn't the
actual algorithm output.

    $ echo 1.3 1.2 3.4 4 2.8 3 6.2 | hist
    
    4     *
    3     *
    2 *   *
    1 *   * *   *
      1 2 3 4 5 6

## Bar plot
Given a factor variable, plot a bar plot

    USAGE: bar [file]

    $ echo duck duck goose | bar

    2 -----
    1 ----- -----
      duck  goose
