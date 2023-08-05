function f=correlfft(x,y)
%Correlaci�n circular entre x e y
y=conj(y); y=vectorRef(y);  %Conjugo y reflejo el vector 'y'
f=ifft(fft(x).*fft(y));     %Convoluci�n circular de x con y reflejada y conjugada
end