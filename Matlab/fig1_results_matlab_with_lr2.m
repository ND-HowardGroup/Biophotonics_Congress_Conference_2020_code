close all
clear all
clc

%Varun Mannam
%date: 12thOct 2019
%calculate the PSNR on test-mix data (NBN on 30th nov 400 epochs 0.5 factor)
format long
font = 14;

psnr_ip = [27.2168486491969,30.0777070812251,32.8605742072988,36.0267686522008,39.7026487922039];
pnsr_op_raw = [34.7031916912650,35.5390330012777,37.0630955079367,38.6029213796523,40.3532378684714];
pnsr_op_purelet = [31.95,33.49,35.29,37.25,39.59];
pnsr_op_BM3D = [32.71,34.09,36.05,38.01,40.6];
pnsr_op_NLM = [31.25,32.85,34.92,37.09,40.04];

%x=[1:5]';
x = [1 2 4 8 16]';
%res = [Raw;Avg2;Avg4;Avg8;Avg16];
%plot(x,psnr_ip','b-*','Linewidth',1);
semilogx(x,psnr_ip','ro-','Linewidth',2);
hold on
%plot(x,pnsr_op','r-*','Linewidth',1);
semilogx(x,pnsr_op_NLM','k-+','Linewidth',2);
semilogx(x,pnsr_op_purelet','g-s','Linewidth',2);
semilogx(x,pnsr_op_BM3D','m-d','Linewidth',2);
semilogx(x,pnsr_op_raw','b-*','Linewidth',2);

title('Instant Denoising Results'); %Noisy Input vs Denoised Output')
legend('Noisy Input','PURE-LET Output','VST+NLM Output','VST+BM3D Output','Instant Denoised Output (this work)','Location','best');
%xlabel({'Number of Noisy images (1, 2, 4, 8 and 16) used for averaging'});%
xlabel({'Number of noisy images averaged'});
ylabel('Test dataset PSNR (dB)');
set(gca,'FontSize',font);%,'XTick', 1:16)
ylim([26,41])
xticks([1 2 4 8 16])
xticklabels({'1','2','4','8','16'})