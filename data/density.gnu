set term png truecolor size 800, 600
set ylabel "Number of asteroids"
set xlabel "log(a)"

set output 'density_inner_a.png'
set style fill solid 0.5
f_inner_a(x)=c_inner_a/sqrt(2*3.1416)/sigma_inner_a*exp(-(x-mu_inner_a)**2/2/sigma_inner_a/sigma_inner_a)
c_inner_a=20000
mu_inner_a=0.85
sigma_inner_a=0.07
fit f_inner_a(x) "inner_log(a).txt" using 1:2 via c_inner_a,mu_inner_a,sigma_inner_a
plot "inner_log(a).txt" using 1:2 with boxes lt 1 lc rgb "red" title "", f_inner_a(x) with lines lc rgb "black" title ""

set output 'density_central_a.png'
set style fill solid 0.5
bin(x,width)=width*floor(x/width)+binwidth/2.0
f_central_a(x)=c_central_a/sqrt(2*3.1416)/sigma_central_a*exp(-(x-mu_central_a)**2/2/sigma_central_a/sigma_central_a)
c_central_a=20000
mu_central_a=0.96
sigma_central_a=0.07
fit f_central_a(x) "central_log(a).txt" using 1:2 via c_central_a,mu_central_a,sigma_central_a
plot "central_log(a).txt" using 1:2 with boxes lt 1 lc rgb "red" title "", f_central_a(x) with lines lc rgb "black" title ""

set output 'density_outer_a.png'
set style fill solid 0.5
bin(x,width)=width*floor(x/width)+binwidth/2.0
f_outer_a(x)=c_outer_a/sqrt(2*3.1416)/sigma_outer_a*exp(-(x-mu_outer_a)**2/2/sigma_outer_a/sigma_outer_a)
c_outer_a=20000
mu_outer_a=1.12
sigma_outer_a=0.07
fit f_outer_a(x) "outer_log(a).txt" using 1:2 via c_outer_a,mu_outer_a,sigma_outer_a
plot "outer_log(a).txt" using 1:2 with boxes lt 1 lc rgb "red" title "", f_outer_a(x) with lines lc rgb "black" title ""

set xlabel "sin(i)"

set output 'density_inner_i.png'
set style fill solid 0.5
f_inner_i(x)=c_inner_i/sqrt(2*3.1416)/sigma_inner_i*exp(-(x-mu_inner_i)**2/2/sigma_inner_i/sigma_inner_i)
c_inner_i=20000
mu_inner_i=0.1
sigma_inner_i=0.07
fit f_inner_i(x) "inner_sin(inc).txt" using 1:2 via c_inner_i,mu_inner_i,sigma_inner_i
plot "inner_sin(inc).txt" using 1:2 with boxes lt 1 lc rgb "red" title "", f_inner_i(x) with lines lc rgb "black" title ""

set output 'density_central_i.png'
set style fill solid 0.5
bin(x,width)=width*floor(x/width)+binwidth/2.0
f_central_i(x)=c_central_i/sqrt(2*3.1416)/sigma_central_i*exp(-(x-mu_central_i)**2/2/sigma_central_i/sigma_central_i)
c_central_i=20000
mu_central_i=0.1
sigma_central_i=0.07
fit f_central_i(x) "central_sin(inc).txt" using 1:2 via c_central_i,mu_central_i,sigma_central_i
plot "central_sin(inc).txt" using 1:2 with boxes lt 1 lc rgb "red" title "", f_central_i(x) with lines lc rgb "black" title ""

set output 'density_outer_i.png'
set style fill solid 0.5
bin(x,width)=width*floor(x/width)+binwidth/2.0
f_outer_i(x)=c_outer_i/sqrt(2*3.1416)/sigma_outer_i*exp(-(x-mu_outer_i)**2/2/sigma_outer_i/sigma_outer_i)
c_outer_i=20000
mu_outer_i=0.1
sigma_outer_i=0.07
fit f_outer_i(x) "outer_sin(inc).txt" using 1:2 via c_outer_i,mu_outer_i,sigma_outer_i
plot "outer_sin(inc).txt" using 1:2 with boxes lt 1 lc rgb "red" title "", f_outer_i(x) with lines lc rgb "black" title ""

set xlabel "e"

set output 'density_inner_e.png'
set style fill solid 0.5
bin(x,width)=width*floor(x/width)+binwidth/2.0
f_inner_e(x)=c_inner_e/sqrt(2*3.1416)/sigma_inner_e*exp(-(x-mu_inner_e)**2/2/sigma_inner_e/sigma_inner_e)
c_inner_e=20000
mu_inner_e=0.2
sigma_inner_e=0.07
fit f_inner_e(x) "inner_e.txt" using 1:2 via c_inner_e,mu_inner_e,sigma_inner_e
plot "inner_e.txt" using 1:2 with boxes lt 1 lc rgb "red" title "", f_inner_e(x) with lines lc rgb "black" title ""

set output 'density_central_e.png'
set style fill solid 0.5
bin(x,width)=width*floor(x/width)+binwidth/2.0
f_central_e(x)=c_central_e/sqrt(2*3.1416)/sigma_central_e*exp(-(x-mu_central_e)**2/2/sigma_central_e/sigma_central_e)
c_central_e=20000
mu_central_e=0.2
sigma_central_e=0.07
fit f_central_e(x) "central_e.txt" using 1:2 via c_central_e,mu_central_e,sigma_central_e
plot "central_e.txt" using 1:2 with boxes lt 1 lc rgb "red" title "", f_central_e(x) with lines lc rgb "black" title ""

set output 'density_outer_e.png'
set style fill solid 0.5
bin(x,width)=width*floor(x/width)+binwidth/2.0
f_outer_e(x)=c_outer_e/sqrt(2*3.1416)/sigma_outer_e*exp(-(x-mu_outer_e)**2/2/sigma_outer_e/sigma_outer_e)
c_outer_e=20000
mu_outer_e=0.2
sigma_outer_e=0.07
fit f_outer_e(x) "outer_e.txt" using 1:2 via c_outer_e,mu_outer_e,sigma_outer_e
plot "outer_e.txt" using 1:2 with boxes lt 1 lc rgb "red" title "", f_outer_e(x) with lines lc rgb "black" title ""

