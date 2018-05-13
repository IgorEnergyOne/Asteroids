set term png truecolor size 800, 600
set encoding utf8

set output "histogram_a.png"
set xlabel "a"
set xrange [2.0:3.3]
set ylabel "N"
set grid x y 
set boxwidth 1 relative
plot "belt50km_a.txt" u 1:2 w boxes lc rgb "red" fill transparent solid 0.5 noborder
