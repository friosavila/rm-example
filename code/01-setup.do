* 01-setup.do
* Setup file for setting global directories

* Set the root directory
global root "C:/Users/Fernando/Documents/GitHub/rm-example"

* Change to root directory
cd "$root"
* Set the data directories
global data      "data"
global raw       "$data/raw"
global processed "$data/processed"
global final     "$data/final"
global doc       "$data/doc"

* Set the code directories
global code     "code"

* Set the results directories
global results "results"
global figures "$results/figures"
global tables  "$results/tables"
global other   "$results/other"

* Installing software
* ssc install reghdfe
* ssc install estout
ssc install color_style
set scheme white2

display "Root directory: $root"
display "Data directories: $data, $raw, $processed, $final, $doc"
display "Code directories: $code, $setup, $cleaning, $analysis, $visuals"
display "Results directories: $results, $figures, $tables, $other"
display "Reports directories: $reports, $proposal, $papers, $presentations"
 