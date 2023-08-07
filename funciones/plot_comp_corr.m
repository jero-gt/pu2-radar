function plot_comp_corr(R,Z2,Z3,Z3_cont)
grosor=20;
figure('outerposition',[0 0 1 1])
subplot(3,1,1)
plot(R,Z2,'b','Linewidth',grosor)
title('Z2[m]')
subplot(3,1,2)
plot(R,Z3,'m','Linewidth',grosor)
title('Z3[m]')
subplot(3,1,3)
plot(R,Z3_cont,'r','Linewidth',grosor)
title('Z3_{cont}[m]')
% suptitle('Comparación correlación circular')

