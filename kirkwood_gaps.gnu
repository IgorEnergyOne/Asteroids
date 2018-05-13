set term png truecolor size 1440, 900
set encoding utf8

set output "kirkwoodgapps.png"
set xlabel "a"
set xrange [2:3.2]
set ylabel "N"
set grid x y 
set samples 2000

a0 = 3.03091

n2(x)=n02*((2*D2/K2+x-a0)*b2 + (1-2*D2*b2/K2)*(erf(abs(x-a0)/(2*sqrt(D2*t)))+exp(K2*(2*abs(x-a0)+K2*t)/4*D2)*erfc((abs(x-a0)+K2*t)/(2*sqrt(D2*t)))))
D2 = 0.0002
K2 = 0.003
n02 = 300.
b2 = 0.1
t = 4.5
fit n2(x) "belt(12-13H)_a.txt" u 1:2 via D2,n02,b2

n3(x)=n03*((2*D3/K3+x-a0)*b3 + (1-2*D3*b3/K3)*(erf(abs(x-a0)/(2*sqrt(D3*t)))+exp(K3*(2*abs(x-a0)+K3*t)/4*D3)*erfc((abs(x-a0)+K3*t)/(2*sqrt(D3*t)))))
D3 = 0.0002
K3 = 0.00003
n03 = 300.
b3 = 0.1
t = 4.5
fit n3(x) "belt(13-14H)_a.txt" u 1:2 via D3,n03,b3

n4(x)=n04*((2*D4/K4+x-a0)*b4 + (1-2*D4*b4/K4)*(erf(abs(x-a0)/(2*sqrt(D4*t)))+exp(K4*(2*abs(x-a0)+K4*t)/4*D4)*erfc((abs(x-a0)+K4*t)/(2*sqrt(D4*t)))))
D4 = 0.002
K4 = 0.00003
n04 = 300.
b4 = 0.1
t = 4.5
fit n4(x) "belt(14-15H)_a.txt" u 1:2 via D4,n04,b4

n5(x)=n05*((2*D5/K5+x-a0)*b5 + (1-2*D5*b5/K5)*(erf(abs(x-a0)/(2*sqrt(D5*t)))+exp(K5*(2*abs(x-a0)+K5*t)/4*D5)*erfc((abs(x-a0)+K5*t)/(2*sqrt(D5*t)))))
D5 = 0.0002
K5 = 0.00003
n05 = 300.
b5 = 0.1
t = 4.5
fit n5(x) "belt(15-16H)_a.txt" u 1:2 via D5,n05,b5

n6(x)=n06*((2*D6/K6+x-a0)*b6 + (1-2*D6*b6/K6)*(erf(abs(x-a0)/(2*sqrt(D6*t)))+exp(K6*(2*abs(x-a0)+K6*t)/4*D6)*erfc((abs(x-a0)+K6*t)/(2*sqrt(D6*t)))))
D6 = 0.000002
K6 = 0.00003
n06 = 300.
b6 = 0.1
t = 4.5
fit n6(x) "belt(16-17H)_a.txt" u 1:2 via D6,n06,b6

n7(x)=n07*((2*D7/K7+x-a0)*b7 + (1-2*D7*b7/K7)*(erf(abs(x-a0)/(2*sqrt(D7*t)))+exp(K7*(2*abs(x-a0)+K7*t)/4*D7)*erfc((abs(x-a0)+K7*t)/(2*sqrt(D7*t)))))
D7 = 0.000002
K7 = 0.00003
n07 = 300.
b7 = 0.1
t = 4.5
fit n7(x) "belt(17-18H)_a.txt" u 1:2 via D7,n07,b7

n8(x)=n08*((2*D8/K8+x-a0)*b8 + (1-2*D8*b8/K8)*(erf(abs(x-a0)/(2*sqrt(D8*t)))+exp(K8*(2*abs(x-a0)+K8*t)/4*D8)*erfc((abs(x-a0)+K8*t)/(2*sqrt(D8*t)))))
D8 = 0.000002
K8 = 0.00003
n08 = 300.
b8 = 0.1
t = 4.5
fit n8(x) "belt(18-19H)_a.txt" u 1:2 via D8,n08,b8,K8

n9(x)=n09*((2*D9/K9+x-a0)*b9 + (1-2*D9*b9/K9)*(erf(abs(x-a0)/(2*sqrt(D9*t)))+exp(K9*(2*abs(x-a0)+K9*t)/4*D9)*erfc((abs(x-a0)+K9*t)/(2*sqrt(D9*t)))))
D9 = 0.000002
K9 = 0.3
n09 = 300.
b9 = 0.1
t = 4.5
fit n9(x) "belt(19-20H)_a.txt" u 1:2 via D9,n09,b9


set boxwidth 1 relative 
plot "belt(13-14H)_a.txt" u 1:($2/n03):($2**0.5/n03) w yerrorbars lc rgb "yellow" title "13-14H", n3(x)/n03 with lines lc rgb "yellow" title "","belt(14-15H)_a.txt" u 1:($2/n04):($2**0.5/n04) w yerrorbars lc rgb "green" title "14-15H", n4(x)/n04 with lines lc rgb "green" title "","belt(15-16H)_a.txt" u 1:($2/n05):($2**0.5/n05) w yerrorbars lc rgb "blue" title "15-16H", n5(x)/n05 with lines lc rgb "blue" title "","belt(16-17H)_a.txt" u 1:($2/n06):($2**0.5/n06) w yerrorbars lc rgb "purple" title "16-17H", n6(x)/n06 with lines lc rgb "purple" title "","belt(17-18H)_a.txt" u 1:($2/n07):($2**0.5/n07) w yerrorbars lc rgb "black" title "17-18H", n7(x)/n07 with lines lc rgb "black" title "","belt(18-19H)_a.txt" u 1:($2/n08):($2**0.5/n08) w yerrorbars lc rgb "red" title "18-19H", n8(x)/n08 with lines lc rgb "red" title "","belt(19-20H)_a.txt" u 1:($2/n09):($2**0.5/n09) w yerrorbars lc rgb "brown" title "19-20H", n9(x)/n09 with lines lc rgb "brown" title ""