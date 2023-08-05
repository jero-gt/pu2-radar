function y=vectorRef(x)
y(1)=x(1);
for i=2:length(x)
    y(i) = x(length(x)-i+2);
end
end

