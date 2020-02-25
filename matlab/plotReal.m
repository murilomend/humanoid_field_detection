clc;close all;clear all;
% 1.714 => convert current to Nm
torque3 = 1.714*[load('../real/torque3.csv') , load('../real_new/torque3.csv')];
torque4 = 1.714*[load('../real/torque4.csv') , load('../real_new/torque4.csv')];
gyroY   = [load('../real/gyroX.csv') , load('../real_new/gyroX.csv')];
gyroX   = [load('../real/gyroY.csv') , load('../real_new/gyroY.csv')];
gyroZ   = [load('../real/gyroZ.csv') , load('../real_new/gyroZ.csv')];
accY   = [load('../real/accX.csv') , load('../real_new/accX.csv')];
accX   = [load('../real/accY.csv') , load('../real_new/accY.csv')];
accZ   = [load('../real/accZ.csv') , load('../real_new/accZ.csv')];
angY   = [load('../real/angX.csv') , load('../real_new/angX.csv')];
angX   = [load('../real/angY.csv') , load('../real_new/angY.csv')];

figure(1)
w = 2*28;
nInter = max(size(angX))/w;
fieldNames = {'Blanket','Artif. Grass','Rubber','Carpet','MDF','Tile'};
seq = [1,2,3,4,5,6];
subplot = @(m,n,p) subtightplot (m, n, p, [0.03 0.005], [0.15 0.05], [0.11 0.00]);
for i = 1:6
    terr = seq(i);
    subplot(10,6,i)
    torque3Imp = reshape(torque3(terr,:),w,[]);
    shadedErrorBar(1:(w/2),torque3Imp(1:(w/2),:)',{@mean, @(x) std(x)},'lineprops', '-b');
    shadedErrorBar((w/2+1):w,torque3Imp((w/2+1):w,:)',{@mean, @(x) std(x)},'lineprops', '--r');
    title(fieldNames(terr));

    if i == 1
        ylabel({'\fontsize{8}TK','\fontsize{8}[Nm]'})
        set(gca,'FontWeight','bold');
    end
    axis([1 56 -3.5 7.1])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-3.5 7.1],'YTick',[-3.5:4.25:7.1])
    else
        set(gca,'yticklabel',[])
    end
    vline(28,'k');
    vline(29,'k');grid minor;
    
    subplot(10,6,i+6)
    torque4Imp = reshape(torque4(terr,:),w,[]);
    shadedErrorBar(1:(w/2),torque4Imp(1:(w/2),:)',{@mean, @(x) std(x)},'lineprops', '-b');
    shadedErrorBar((w/2+1):w,torque4Imp((w/2+1):w,:)',{@mean, @(x) std(x)},'lineprops', '--r');
    
    if i == 1
        ylabel({'\fontsize{8}TA','\fontsize{8}[Nm]'})
        set(gca,'FontWeight','bold');
    end
    axis([1 56 -3.0 4])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-3.0 4],'YTick',[-3.0:3.5:4])
    else
        set(gca,'yticklabel',[])
    end
    vline(28,'k');
    vline(29,'k');grid minor;
    
    subplot(10,6,i+12)
    accXImp = reshape(accX(terr,:),w,[]);
    shadedErrorBar(1:(w/2),accXImp(1:(w/2),:)',{@mean, @(x) std(x)},'lineprops', '-b');
    shadedErrorBar((w/2+1):w,accXImp((w/2+1):w,:)',{@mean, @(x) std(x)},'lineprops', '--r');
    if i == 1
        ylabel({'\fontsize{8}AX','\fontsize{8}[m/s^2]'})
        set(gca,'FontWeight','bold');
    end
    axis([1 56 -3.1 3.8])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-3.1 3.8],'YTick',[-3.1:3.1:3.8])
    else
        set(gca,'yticklabel',[])
    end
    vline(28,'k');
    vline(29,'k');grid minor;
    
    subplot(10,6,i+18)
    accYImp = reshape(accY(terr,:),w,[]);
    shadedErrorBar(1:(w/2),accYImp(1:(w/2),:)',{@mean, @(x) std(x)},'lineprops', '-b');
    shadedErrorBar((w/2+1):w,accYImp((w/2+1):w,:)',{@mean, @(x) std(x)},'lineprops', '--r');
    if i == 1
        ylabel({'\fontsize{8}AY','\fontsize{8}[m/s^2]'})
        set(gca,'FontWeight','bold');
    end
    axis([1 56 -4 5.5])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-4 5.5],'YTick',[-4:4:5.5]);
    else
        set(gca,'yticklabel',[])
    end
    vline(28,'k');
    vline(29,'k');grid minor;
    
    subplot(10,6,i+24)
    accZImp = reshape(accZ(terr,:),w,[]);
    shadedErrorBar(1:(w/2),accZImp(1:(w/2),:)',{@mean, @(x) std(x)},'lineprops', '-b');
    shadedErrorBar((w/2+1):w,accZImp((w/2+1):w,:)',{@mean, @(x) std(x)},'lineprops', '--r');
    if i == 1
        ylabel({'\fontsize{8}AZ','\fontsize{8}[m/s^2]'})
        set(gca,'FontWeight','bold');
    end
    axis([1 56 5 15])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        ;
    else
        set(gca,'yticklabel',[])
    end
    vline(28,'k');
    vline(29,'k');grid minor;
    
    subplot(10,6,i+30)
    gyroXImp = reshape(gyroX(terr,:),w,[]);
    shadedErrorBar(1:(w/2),gyroXImp(1:(w/2),:)',{@mean, @(x) std(x)},'lineprops', '-b');
    shadedErrorBar((w/2+1):w,gyroXImp((w/2+1):w,:)',{@mean, @(x) std(x)},'lineprops', '--r');
    if i == 1
        ylabel({'\fontsize{8}GX','\fontsize{8}[rad/s]'})
        set(gca,'FontWeight','bold');
    end
    axis([1 56 -1.2 0.9])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-1.2 0.9],'YTick',[-1.2:1.0:0.9])
    else
        set(gca,'yticklabel',[])
    end
    vline(28,'k');
    vline(29,'k');grid minor;
  
    subplot(10,6,i+36)
    gyroYImp = reshape(gyroY(terr,:),w,[]);
    shadedErrorBar(1:(w/2),gyroYImp(1:(w/2),:)',{@mean, @(x) std(x)},'lineprops', '-b');
    shadedErrorBar((w/2+1):w,gyroYImp((w/2+1):w,:)',{@mean, @(x) std(x)},'lineprops', '--r');
    if i == 1
        ylabel({'\fontsize{8}GY','\fontsize{8}[rad/s]'})
        set(gca,'FontWeight','bold');
    end
    axis([1 56 -1.2 0.9])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-1.2 0.9],'YTick',[-1.2:1:0.9])
    else
        set(gca,'yticklabel',[])
    end
    vline(28,'k');
    vline(29,'k');grid minor;
    
    subplot(10,6,i+42)
    gyroZImp = reshape(gyroZ(terr,:),w,[]);
    shadedErrorBar(1:(w/2),gyroZImp(1:(w/2),:)',{@mean, @(x) std(x)},'lineprops', '-b');
    shadedErrorBar((w/2+1):w,gyroZImp((w/2+1):w,:)',{@mean, @(x) std(x)},'lineprops', '--r');
    if i == 1
        ylabel({'\fontsize{8}GZ','\fontsize{8}[rad/s]'})
        set(gca,'FontWeight','bold');
    end
    axis([1 56 -1.2 1])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        ;
    else
        set(gca,'yticklabel',[])
    end
    vline(28,'k');
    vline(29,'k');grid minor;
    
    subplot(10,6,i+48)
    angXImp = reshape(angX(terr,:),w,[]);
    shadedErrorBar(1:(w/2),angXImp(1:(w/2),:)',{@mean, @(x) std(x)},'lineprops', '-b');
    shadedErrorBar((w/2+1):w,angXImp((w/2+1):w,:)',{@mean, @(x) std(x)},'lineprops', '--r');
    if i == 1
        ylabel({'\fontsize{8}QX','\fontsize{8}[deg]'})
        set(gca,'FontWeight','bold');
    end
    axis([1 56 -30 10])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-30 10],'YTick',[-30:20:10])
    else
        set(gca,'yticklabel',[])
    end
    vline(28,'k');
    vline(29,'k');grid minor;
    
    subplot(10,6,i+54)
    angYImp = reshape(angY(terr,:),w,[]);
    shadedErrorBar(1:(w/2),angYImp(1:(w/2),:)',{@mean, @(x) std(x)},'lineprops', '-b');
    shadedErrorBar((w/2+1):w,angYImp((w/2+1):w,:)',{@mean, @(x) std(x)},'lineprops', '--r');
    xlabel('Samples');
    if i == 1
        ylabel({'\fontsize{8}QY','\fontsize{8}[deg]'})
        set(gca,'FontWeight','bold');
    end
    axis([1 56 -13 20])
    set(gca,'XTickLabel',str2mat(' (1~28)','','',' (1~28)','',''))
    set(gca,'XTickLabelRotation',45);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    
    if i == 1
        ;
    else
        set(gca,'yticklabel',[])
        %ylabel('');set(get(gca,'ylabel'),'rotation',0);
    end
    vline(28,'k');
    vline(29,'k');grid minor;
end