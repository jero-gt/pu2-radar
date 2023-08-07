function plotTriple(lim_ejeX, eje_x, titulo1, titulo2, titulo3, tam_letra, col, grosor, n,x1,x2,x3)
%plotTriple(lim_ejes, eje_x, titulo1, titulo2, titulo3, tam_letra, col, grosor, n,x1,x2,x3)

%SE ADAPTA AUTOMATICAMENTE AL EJE Y, SOLO INDICARLE VECTOR DE EJE X EN
%PRIMER PARAMETRO

%SUPONE UN UNICO EJE X PARA LAS TRES FIGURAS. 

%GRAFICA LAS 3 EN UN MISMO COLOR.

%AL TENER TITULO LE BORR� LA INDICACI�N DE 'EJE Y'
    

    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo1, 'NumberTitle', 'off'); % Creo y maximizo figura.
    subplot(3,1,1);
    plot(n, x1, col, 'Linewidth', grosor);
    xlim(lim_ejeX); grid off; % L ??mites de los ejes. Grilla.
    ylim('auto');
    view(0, 90); % Sitúa la gráfica en el eje real
    xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
    ylabel('','Interpreter','Latex'); % Nombro el eje x.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title(titulo1); % Coloco t ??tulo para el gr ?afico.
    % Nota: Lo de 'interpreter', 'Latex' es opcional...s ?olo modifica la
    % fuente. Pueden googlear Latex como editor de textos...
    
    subplot(3,1,2);
    plot(n, x2, col, 'Linewidth', grosor);
    xlim(lim_ejeX); grid off; % L ??mites de los ejes. Grilla.
    ylim('auto');
    view(0, 90); % Sitúa la gráfica en el eje real
    xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
    ylabel('','Interpreter','Latex'); % Nombro el eje x.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title(titulo2); % Coloco t ??tulo para el gr ?afico.
    
    subplot(3,1,3)
    plot(n, x3, col, 'Linewidth', grosor);
    xlim(lim_ejeX); grid off; % L ??mites de los ejes. Grilla.
    ylim('auto');
    view(0, 90); % Sitúa la gráfica en el eje real
    xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
    ylabel('','Interpreter','Latex'); % Nombro el eje x.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title(titulo3); % Coloco t ??tulo para el gr ?afico.
end

