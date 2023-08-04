%%TP UTILITARIO 2 - RADAR
addpath(genpath('.'));
clc; close all; clearvars;
%% DEFINICION DE VARIABLES
fs = 12.5e6;
[y,n] = radarRx1;
c = 3e8;
t = n./fs;
R = t.*(c/2);
T = 1e-3;
tau = 0.1e-3;
x = cajon((t-(tau/2))/tau);

plotCompleto([R(1) R(end) -0.5 1.5], 'R [m]' , '', 'Señal recibida y[n]', 20, 'r-',2,R,y );
plotCompleto([t(1) t(end) -0.5 1.5], 't [ms]' , '', 'Cajón', 20, 'r',2,t,x);
plotHold([R(1) R(end) -0.5 1.5], 'R [m]' , '', 'Señal recibida y[n]', 20, 'r', 'b', 2, R, y, x,'Recibida', 'Transmitida');

%%
z= y+randn(size(y));
plotHold([R(1) R(end) -5 5], 'R [m]' , '', 'Señal recibida y[n]', 20, 'r', 'b', 2, R, z, x,'Rec. contamindada', 'Transmitida');
