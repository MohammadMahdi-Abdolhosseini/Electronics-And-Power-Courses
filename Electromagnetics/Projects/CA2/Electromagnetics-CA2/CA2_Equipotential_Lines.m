% Electromagnetics:
% CA2: Equipotential Lines 
% Mohammad Mahdi Abdolhosseini 810198434
% AmirHossein Erfanimonfared 810198440
% Master: Dr.Neshat
V0 = 1;
b = 1;
[X,Y] = meshgrid(0.01:0.01:1,0:0.01:b);
Vxy = 0;
for n=1:2:100
    Cn = 4*V0/(pi*n);
    Vxy = Vxy + Cn*exp(-n*pi*X/b).*sin(n*pi*Y/b);
    [C,h] = contour(X, Y, Vxy);
    clabel(C,h,'FontSize',10,'Color','r','labelspacing',700)
end
title('Equipotential Lines')