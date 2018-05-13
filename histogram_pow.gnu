set term png truecolor size 400, 300
set encoding utf8

set output "graph_pow.png"
set xlabel "p"
set xrange [0.0:0.1]
set ylabel "pow"
set yrange [0.0:2.5]
set grid x y 
set boxwidth 1 relative
plot "dist_pow[0-0.1].txt" u 1:2:3 t "Power" w yerr lc rgb "red"