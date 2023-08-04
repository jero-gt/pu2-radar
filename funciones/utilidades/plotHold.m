function plotHold(lim_ejes,eje_x,eje_y,titulo,tam_letra,col1,col2,grosor,t,x1,x2,leyenda1,leyenda2)
    % plotCompleto(lim_ejes,'eje_x','eje_y','titulo',tam_letra,'col1','col2',grosor,t,x1,x2,'legend1','legen2')

    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo, 'NumberTitle', 'off'); % Creo y maximizo figura.
    plot(t,x1,col1,'Linewidth',grosor); % Grafico. Color (y marcador) y grosor.
    hold on
    plot(t,x2,col2,'Linewidth',grosor)
    legend(leyenda1,leyenda2);
    axis(lim_ejes); 
    %grid on; % L Ì?Ä±mites de los ejes. Grilla.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
    ylabel(eje_y,'Interpreter','Latex'); % Nombro el eje y.
    title(titulo); % Coloco t Ì?Ä±tulo para el gr Ì?afico.
end