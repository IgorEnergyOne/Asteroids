set term png truecolor size 1440, 900 font "Times New Roman,20"
set encoding utf8

set output "kirkwoodgap 5:2.png"
set xlabel "x, AU"
set xrange [-0.05:0.05]
set ylabel "N"
set grid x y 
set samples 1000

n2(x)=n02*(erf(abs(x)/(2*sqrt(D2*t)))+exp(K2*(2*abs(x)+K2*t)/4*D2)*erfc((abs(x)+K2*t)/(2*sqrt(D2*t))))
D2 = 0.0000205
K2 = 0.00612
n02 = 300.
t = 4.5
fit n2(x) "2.82 13-14.txt" u 1:2 via D2,n02

n3(x)=n03*(erf(abs(x)/(2*sqrt(D3*t)))+exp(K3*(2*abs(x)+K3*t)/4*D3)*erfc((abs(x)+K3*t)/(2*sqrt(D3*t))))
D3 = 0.00002
K3 = 0.00612
n03 = 300.
t = 4.5
fit n3(x) "2.82 14-15.txt" u 1:2 via D3,n03

n4(x)=n04*(erf(abs(x)/(2*sqrt(D4*t)))+exp(K4*(2*abs(x)+K4*t)/4*D4)*erfc((abs(x)+K4*t)/(2*sqrt(D4*t))))
D4 = 0.00005
K4 = 0.00612
n04 = 300.
t = 4.5
fit n4(x) "2.82 15-16.txt" u 1:2 via D4,n04

n5(x)=n05*(erf(abs(x)/(2*sqrt(D5*t)))+exp(K5*(2*abs(x)+K5*t)/4*D5)*erfc((abs(x)+K5*t)/(2*sqrt(D5*t))))
D5 = 0.00002
K5 = 0.00612 
n05 = 300.
t = 4.5
fit n5(x) "2.82 16-17.txt" u 1:2 via D5,n05

n6(x)=n06*(erf(abs(x)/(2*sqrt(D6*t)))+exp(K6*(2*abs(x)+K6*t)/4*D6)*erfc((abs(x)+K6*t)/(2*sqrt(D6*t))))
D6 = 0.00002
K6 = 0.00612 
n06 = 300.
t = 4.5
fit n6(x) "2.82 17-18.txt" u 1:2 via D6,n06

n7(x)=n07*(erf(abs(x)/(2*sqrt(D7*t)))+exp(K7*(2*abs(x)+K7*t)/4*D7)*erfc((abs(x)+K7*t)/(2*sqrt(D7*t))))
D7 = 0.0001
K7 = 0.00612
n07 = 300.
t = 4.5
fit n7(x) "2.82 18-19.txt" u 1:2 via D7,n07

n8(x)=n08*(erf(abs(x)/(2*sqrt(D8*t)))+exp(K8*(2*abs(x)+K8*t)/4*D8)*erfc((abs(x)+K8*t)/(2*sqrt(D8*t))))
D8 = 0.00003
K8 = 0.00612
n08 = 300.
t = 4.5
fit n8(x) "2.82 19-20.txt" u 1:2 via D8,n08

set boxwidth 1 relative 
plot "2.82 13-14.txt" u 1:($2/n02) w points lc rgb "red" title "13-14 M", n2(x)/n02 with lines lc rgb "red" title "","2.82 14-15.txt" u 1:($2/n03) w points lc rgb "orange" title "14-15 M", n3(x)/n03 with lines lc rgb "orange" title "","2.82 15-16.txt" u 1:($2/n04) w points lc rgb "yellow" title "15-16 M", n4(x)/n04 with lines lc rgb "yellow" title "","2.82 16-17.txt" u 1:($2/n05) w points lc rgb "green" title "16-17 M", n5(x)/n05 with lines lc rgb "green" title "","2.82 17-18.txt" u 1:($2/n06) w points lc rgb "blue" title "17-18 M", n6(x)/n06 with lines lc rgb "blue" title "","2.82 18-19.txt" u 1:($2/n07) w points lc rgb "purple" title "18-19 M", n7(x)/n07 with lines lc rgb "purple" title "","2.82 19-20.txt" u 1:($2/n08) w points lc rgb "black" title "19-20 M", n8(x)/n08 with lines lc rgb "black" title ""