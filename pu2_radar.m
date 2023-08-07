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
plotCompleto([R(1) R(end) 0 1.5e3], 'R [m]' , '', 'M�dulo de la correlaci�n circular', 20, 'm',2,R,Z1 );

%% Segunda se�al recibida
z2= radarRx2;
plotHold([R(1) R(end) -0.5 2.5], 'R [m]' , '', 'Se�ales', 20, 'r', 'b', 2, R, z2, x,'Recibida', 'Transmitida');
Z2 = abs(correlfft(z2,x));
plotCompleto([R(1) R(end) 0 2e3], 'R [m]' , '', 'M�dulo de la corr. (se�al 2)', 20,'m' ,2,R,Z2 );
	

%% Tercera se�al recibida (transmision up-chirp)
%Definci�n de variables
beta = 250e3;
xm = cajon((t-(tau/2))/tau).*cos(((pi*beta/tau).*(t.^2)));
z3=radarRx3;

plotCompleto([R(1) R(end) -2 2], 'R [m]' , '', 'Se�al recibida z3[n]', 20, 'r-',2,R,z3 );
plotHold([R(1) R(end) -2 2], 'R [m]' , '', 'Se�ales', 20, 'r', 'b', 2, R, z3, xm,'Recibida', 'Transmitida');

Z3 = abs(correlfft(z3,xm));
plotCompleto([R(1) R(end) 0 0.7e3], 'R [m]' , '', '|Z_3[m]| ', 20, 'm',2,R,Z3 );
%% Tercera se�al contaminada (transmision up-chirp)
z3_cont = z3 + randn(size(z3));
plotHold([R(1) R(end) -5 5], 'R [m]' , '', 'Se�ales', 20, 'r', 'b', 2, R, z3_cont, xm,'Rec. contamindada', 'Transmitida');
Z3_cont = abs(correlfft(z3_cont,xm));
plotCompleto([R(1) R(end) 0 0.7e3], 'R [m]' , '', '|Z3_{cont}[m]|', 20, 'm',2,R,Z3_cont );

%Comparaci�n de Corr. circular(se�al 2, se�al 3 y se�al 3 contaminada)
plotTriple([R(1) R(end)],'R [m]','Z2[m]','Z3[m]','Z3_{cont}[m]',20,'m',1.5,R,abs(Z2),abs(Z3),abs(Z3_cont))