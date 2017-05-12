 %%LDA from professor
 
 
 %%proper LDA
markers = (SBType_ind2 - 1)';
x = Ds(SBEmployers(:),find(Q == min(Q)));
y = Ds(SBEmployers(:),find(Q == 0));
z = Ds(SBEmployers(:),find(Q == max(Q)));
[class,err,POSTERIOR,logp,coeff] = classify([x y z],[x y z], markers);
errind = find(class ~= markers);
K = coeff(1,2).const;
L = coeff(1,2).linear; 
%f2 = [num2str(K) ' + x * (' num2str(L(1)) ') + y * (' num2str(L(2)) ') + z * (' num2str(L(3)-0.2) ')']; 
f2 = [num2str(K) ' + x * (' num2str(L(1)) ') + y * (' num2str(L(2)) ') + z * (' num2str(L(3)) ')'] 

winhandle = figure;
set(winhandle, 'color', 'white');
winhandle = axes, hold on;
set(winhandle, 'color', [250 250 235]/255);
set(winhandle, 'XColor',[95 0 169]/255,'YColor',[95 0 169]/255, 'ZColor',[95 0 169]/255);
h2 = ezimplot3(f2,[min(x)-0.05 max(x)+0.05 min(y)-0.05 max(y)+0.05 min(z)-0.05 max(z)+0.05], 60, color2);

xlabel(winhandle,['$\alpha(' num2str(min(Q)) ')$'],'Interpreter','latex','FontSize', 10);
ylabel(winhandle,'$\alpha(0)$','Interpreter','latex','FontSize', 10);
zlabel(winhandle,['$\alpha(' num2str(max(Q)) ')$'],'Interpreter','latex','FontSize', 10);
%set(winhandle, 'XTickLabel', '');
%set(winhandle, 'YTickLabel', '');
for i = 1:53
    plot3(x(i), y(i), z(i), '*', 'color', colors(SBType_ind2(i), :), 'MarkerSize', max(1,i/5));
    text(x(i), y(i), z(i), labels{SBEmployers(i)},'Color',colors(SBType_ind2(i), :), 'FontSize', 0 + round(log(Nemployers(SBEmployers(i)))/log(2)));
end
axis([min(x)-0.05 max(x)+0.05 min(y)-0.05 max(y)+0.05 min(z)-0.05 max(z)+0.05]);
%title('\textbf{Classified by value of market capitalization}','Interpreter','latex','FontSize', 12,'Color',[95 0 169]/255);
title('{\bf }');

for i = 1:length(errind)
    plot3(x(errind(i)), y(errind(i)), z(errind(i)),'o', 'Color',color1, 'MarkerSize',15, 'Linewidth', 2)
end