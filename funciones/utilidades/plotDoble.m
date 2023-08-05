function plotDoble(lim_ejes1,lim_ejes2, eje_x, eje_y, titulo1, titulo2, tam_letra, col, grosor, n1, x1, n2, x2)

%plotDoble(lim_ejes1,lim_ejes2, eje_x, eje_y, titulo1, titulo2, tam_letra, col, grosor, n1, x1, n2, x2)
    

    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo1, 'NumberTitle', 'off'); % Creo y maximizo figura.
    subplot(2,1,1);
    plot(n1, x1, col, 'Linewidth', grosor);
    axis(lim_ejes1); grid off; % L ??mites de los ejes. Grilla.
    view(0, 90); % Sitúa la gráfica en el eje real
    xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
    ylabel(eje_y,'Interpreter','Latex'); % Nombro el eje x.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title(titulo1); % Coloco t ??tulo para el gr ?afico.
    % Nota: Lo de 'interpreter', 'Latex' es opcional...s ?olo modifica la
    % fuente. Pueden googlear Latex como editor de textos...
    
    subplot(2,1,2);
    plot(n2, x2, col, 'Linewidth', grosor);
    axis(lim_ejes2); grid off; % L ??mites de los ejes. Grilla.
    view(0, 90); % Sitúa la gráfica en el eje real
    xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
    ylabel(eje_y,'Interpreter','Latex'); % Nombro el eje x.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title(titulo2); % Coloco t ??tulo para el gr ?afico.
end

