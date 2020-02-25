clc;close all;clear all;
step = 201;
new = 800;
w = 28;

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

% Data Standardization
torque3 = (torque3 - mean(torque3(:,1:new*w)')')./std(torque3(:,1:new*w)')';
torque4 = (torque4 - mean(torque4(:,1:new*w)')')./std(torque4(:,1:new*w)')';
gyroX   = (gyroX - mean(gyroX(:,1:new*w)')')./std(gyroX(:,1:new*w)')';
gyroY   = (gyroY - mean(gyroY(:,1:new*w)')')./std(gyroY(:,1:new*w)')';
gyroZ   = (gyroZ - mean(gyroZ(:,1:new*w)')')./std(gyroZ(:,1:new*w)')';
accX    = (accX - mean(accX(:,1:new*w)')')./std(accX(:,1:new*w)')';
accY    = (accY - mean(accY(:,1:new*w)')')./std(accY(:,1:new*w)')';
accZ    = (accZ - mean(accZ(:,1:new*w)')')./std(accZ(:,1:new*w)')';
angX    = (angX - mean(angX(:,1:new*w)')')./std(angX(:,1:new*w)')';
angY    = (angY - mean(angY(:,1:new*w)')')./std(angY(:,1:new*w)')';


nInter = max(size(angX))/w;
fieldNames = {'Blanket','Artif. Grass','Rubber','Carpet','MDF','Tile'};

interv1 = (step*w + 1):((step + 1)*w);
step = step + 2;
interv2 = (step*w + 1):((step + 1)*w);

subplot = @(m,n,p) subtightplot (m, n, p, [0.08 0], [0.15 0.05], [0.00 0.000]);
for i = 1:6
    subplot(6,2,2*i - 1);
    M = [ angX(i,interv1); 
          angY(i,interv1); 
          accX(i,interv1); 
          accY(i,interv1); 
          accZ(i,interv1); 
          gyroX(i,interv1); 
          gyroY(i,interv1); 
          gyroZ(i,interv1); 
          torque3(i,interv1); 
          torque4(i,interv1); 
        ]; 
    imshow(M, 'Border','tight'); 
    caxis([-5 5])
    if(i == 6)
      xlabel('\fontsize{12}Samples');
    end
    ylabel('\fontsize{12}Data')
    title(fieldNames(i));    
    set(gca,'FontSize',12); 
    axis on
    
    subplot(6,2,2*i);
    M = [ angX(i,interv2); 
          angY(i,interv2); 
          accX(i,interv2); 
          accY(i,interv2); 
          accZ(i,interv2); 
          gyroX(i,interv2); 
          gyroY(i,interv2); 
          gyroZ(i,interv2); 
          torque3(i,interv2); 
          torque4(i,interv2); 
        ]; 
    imshow(M, 'Border','tight'); 
    caxis([-5 5])
    if(i == 6)
      xlabel('\fontsize{12}Samples');
    end
    ylabel('\fontsize{12}Data')
    title(fieldNames(i));  
    set(gca,'FontSize',12);
    axis on
        
end

colorbar('horiz','Position', [0.21,0.015,0.58,0.045],'AxisLocation', 'out' )



