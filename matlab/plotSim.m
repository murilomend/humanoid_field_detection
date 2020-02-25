clc;close all;clear all;

torque3 = load('sim/torque3.csv');
torque4 = load('sim/torque4.csv');
gyroY   = load('sim/gyroX.csv');
gyroX   = load('sim/gyroY.csv');
gyroZ   = load('sim/gyroZ.csv');
accY   = load('sim/accX.csv');
accX   = load('sim/accY.csv');
accZ   = load('sim/accZ.csv');
angY   = load('sim/angX.csv');
angX   = load('sim/angY.csv');

figure(1)
w = 2*28;
nInter = max(size(angX))/w;
fieldNames = {'Terrain 1','Terrain 2', 'Terrain 3' ,'Terrain 4' ,'Terrain 5' ,'Terrain 6'};
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
    axis([1 56 -20 6.0])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-20 6.0],'YTick',[-20:12:6.0])
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
    axis([1 56 -10 16])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-10 16],'YTick',[-10:12:16])
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
    axis([1 56 -8 8])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-8 8],'YTick',[-8:7:8])
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
    axis([1 56 -10 10])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-10 10],'YTick',[-10:9:10]);
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
    axis([1 56 -7 25])
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
    axis([1 56 -2 2])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-2 2],'YTick',[-2:1.5:2])
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
    axis([1 56 -1.4 1.2])
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
    axis([1 56 -12 10])
    set(gca,'xticklabel',[]);     set(gca,'FontSize',8);     set(gca,'FontWeight','bold');
    if i == 1
        set(gca,'YLim',[-12 10],'YTick',[-12:10:10])
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
    axis([1 56 -5 7])
    set(gca,'XTickLabel',str2mat(' (1~28)','','',' (1~28)','',''))
    set(gca,'XTickLabelRotation',45);
    set(gca,'FontSize',8);
    set(gca,'FontWeight','bold');
    
    if i == 1
        ;
    else
        set(gca,'yticklabel',[])
    end
    vline(28,'k');
    vline(29,'k');grid minor;
end