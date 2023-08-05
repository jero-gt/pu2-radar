function f=correlfft(x,y)
%Correlación circular entre x e y
y=conj(y); y=vectorRef(y);  %Conjugo y reflejo el vector 'y'
f=ifft(fft(x).*fft(y));     %Convolución circular de x con y reflejada y conjugada
end