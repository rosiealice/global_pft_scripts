plotheight=20;
plotwidth=16;
subplotsx=3;
subplotsy=5;   
leftedge=1.2;
rightedge=0.4;   
topedge=1;
bottomedge=1.5;
spacex=0.2;
spacey=0.2;
fontsize=5; 
   
sub_pos=subplot_pos(plotwidth,plotheight,leftedge,rightedge,bottomedge,topedge,subplotsx,subplotsy,spacex,spacey);
 
 
 f=figure('visible','on')
clf(f);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [plotwidth plotheight]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 plotwidth plotheight]);
 
%loop to create axes
for i=1:subplotsx
for ii=1:subplotsy
 
ax=axes('position',sub_pos{i,ii},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
 
z=peaks;
contour(z);
 
if ii==subplotsy
title(['Title (',num2str(i),')'])
end
 
if ii>1
set(ax,'xticklabel',[])
end
 
if i>1
set(ax,'yticklabel',[])
end
 
if i==1
ylabel(['Ylabel (',num2str(ii),')'])
end
 
if ii==1
xlabel(['Ylabel (',num2str(i),')'])
end
 
end
end
 
%Saving eps with matlab and then producing pdf and png with system commands
filename=['test'];
print(gcf, '-depsc2','-loose',[filename,'.eps']);
system(['epstopdf ',filename,'.eps'])
system(['convert -density 300 ',filename,'.eps ',filename,'.png'])


