set term png truecolor size 800, 600
set encoding utf8

set output "histogram.png"
set xlabel "a"
set xrange [2.0:3.3]
set ylabel "N"
set grid x y 
f(x)=a*x**b
a=100000.
b=1.
fit f(x) "count_file.txt" u 1:2 via a,b
set boxwidth 1 relative
plot "count_file.txt" u 1:2 w boxes lc rgb "red" fill transparent solid 0.5 noborder title "", f(x) with lines lc rgb "black" title ""