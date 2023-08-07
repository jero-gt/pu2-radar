%%TP UTILITARIO 2 - RADAR
addpath(genpath('.'));
clc; close all; clearvars;
%% DEFINICION DE VARIABLES
fs = 12.5e6;
[z1,n] = radarRx1;
c = 3e8;
t = n./fs;
R = t.*(c/2);
T = 1e-3;
tau = 0.1e-3;
x = cajon((t-(tau/2))/tau);

plotCompleto([R(1) R(end) -0.5 1.5], 'R [m]' , '', 'Se�al recibida z1[n]', 20, 'r-',2,R,z1 );
plotHold([R(1) R(end) -0.5 1.5], 'R [m]' , '', 'Se�ales', 20, 'r', 'b', 2, R, z1, x,'Recibida', 'Transmitida');

%% Correlaci�n circular - se�al contaminada
z1_cont= z1+randn(size(z1));
plotHold([R(1) R(end) -5 5], 'R [m]' , '', 'Se�ales', 20, 'r', 'b', 2, R, z1_cont, x,'Rec. contamindada', 'Transmitida');

Z1 = abs(correlfft(z1_cont,x));
plotCompleto([R(1) R(end) 0 1.5e3], 'R [m]' , '', 'M�dulo de la correlaci�n circular', 20, 'r',2,R,Z1 );

%% Segunda se�al recibida
z2= radarRx2;
plotHold([R(1) R(end) -0.5 2.5], 'R [m]' , '', 'Se�ales', 20, 'r', 'b', 2, R, z2, x,'Recibida', 'Transmitida');
Z2 = abs(correlfft(z2,x));
plotCompleto([R(1) R(end) 0 2e3], 'R [m]' , '', 'M�dulo de la corr. (se�al 2)', 20,'r' ,2,R,Z2 );
	

%% Tercera se�al recibida (transmision up-chirp)
beta = 250e3;
xm = cajon((t-(tau/2))/tau).*cos(((pi*beta/tau).*(t.^2)));
z3=radarRx3;
plotCompleto([R(1) R(end) -2 2], 'R [m]' , '', 'Se�al recibida z3[n]', 20, 'r-',2,R,z3 );
plotHold([R(1) R(end) -2 2], 'R [m]' , '', 'Se�ales', 20, 'r', 'b', 2, R, z3, xm,'Recibida', 'Transmitida');
Z3 = abs(correlfft(z3,xm));
plotCompleto([R(1) R(end) 0 0.7e3], 'R [m]' , '', '|Z_3[m]| ', 20, 'r-',2,R,Z3 );
plotDoble([R(1) R(end) 0 2e3], [R(1) R(end) 0 0.7e3],'R [m]' , '', '|Z_2[m]|', '|Z_3[m]|', 20, 'b', 2, R, Z2, R, Z3)
%% Tercera se�al contaminada (transmision up-chirp)
z3_cont = z3 + randn(size(z3));
plotHold([R(1) R(end) -5 5], 'R [m]' , '', 'Se�ales', 20, 'r', 'b', 2, R, z3_cont, xm,'Rec. contamindada', 'Transmitida');
Z3_cont = abs(correlfft(z3_cont,xm));
plotCompleto([R(1) R(end) 0 0.7e3], 'R [m]' , '', '|Z_{cont}[m]|', 20, 'r-',2,R,Z3_cont );

%% Espectro de las se�ales
[X,f] = fft_kit(x,fs);
 XM = fft_kit(xm,fs);
stemDoble([-fs/2 fs/2 0 1.3e3],[-fs/2 fs/2 0 200], 'f[Hz]','','|X[k]|','|XM[k]|',20, 'b.',0.5,f,abs(X),f,abs(XM));



%% PRUEBAS ESPECTRO
% x2 = cajon((t-((2.5)*tau))/(5*tau));
% xm2 = x2.*cos(((pi*beta/tau).*(t.^2)));
% plotDoble([t(1) t(end) -0.5 1.5],[t(1) t(end) -1.5 1.5],'t[s]','','cajon 2','up-chrip2',20,'r',1.5,t,x2,t,xm2);
% 
% [X2,f] = fft_kit(x2,fs);
% XM2 = fft_kit(xm2,fs);
% stemDoble([-fs/2 fs/2 0 1.3e3],[-fs/2 fs/2 0 200], 'f[Hz]','','|X[k]2|','|XM2[k]|',20, 'b.',0.5,f,abs(X2),f,abs(XM2));
% 
% % 
% % 
% 
% 
% x3 = cajon(3*(t-(tau/6))/tau);
% xm3 = x3.*cos(((pi*beta/tau).*(t.^2)));
% plotDoble([t(1) t(end) -0.5 1.5],[t(1) t(end) -1.5 1.5],'t[s]','','cajon 3','up-chrip3',20,'r',1.5,t,x3,t,xm3);
% [X3,f] = fft_kit(x3,fs);
% XM3 = fft_kit(xm3,fs);
% stemDoble([-fs/2 fs/2 0 1.3e3],[-fs/2 fs/2 0 200], 'f[Hz]','','|X[k]3|','|XM3[k]|',20, 'b.',0.5,f,abs(X3),f,abs(XM3));

% 
% a=correlfft(x,x);
% b=correlfft(xm,xm);
% plot(R,a)
% plot(R,b)
% 






