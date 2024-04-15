%%
% Example 5.1: Line Plot
clear; clc;

% Line plot
% Data: Global temperature in degree celsius (2010-2020)
year = 2010:1:2020;
temp = [14.46 14.55 14.48 14.67 14.82 15.16 14.83 ...
    14.88 14.89 15.05 14.78];
plot(year,temp,'b-o','linewidth',1.5);
xlabel('Years');
ylabel('Temperature (degree celsius');
title('Line plot of global temperature (2010-2020)')
grid on;

%%
% Example 5.2: Subplot
clear; clc;

% Subplot
% Data of global temperature from 2010:2020
% Temperature unit: degree celsius and fahrenheit
year = 2010:1:2020;
temp_C = [14.46 14.55 14.48 14.67 14. 82 15.16 14.83 ...
    14.88 14.89 15.05 14.78];
temp_F = [58.028 58.19 58.48 58.67 58.82 58.16 59.83 ...
    58.688 58.802 59.09 58.604];
subplot(1,2,1);
plot(year,temp_C,'b-o','linewidth',1.5);
xlabel('Years');
ylabel('Temperature (degree celsius');
title('Global temperature (2010-2020)')
grid on;
subplot(1,2,2);
plot(year,temp_F,'b-o','linewidth',1.5);
xlabel('Years');
ylabel('Temperature (farenheit');
title('Global temperature (2010-2020)')
grid on;

%%
% Example 5.4: Bar Plot
clear; clc;

% Bar plot
% Data of global temperature from 2010:2020
% Temperature unit: degree celsius and fahrenheit
year = 2010:1:2020;
CO2 = [30.5824 31.4595 31.806 32.3707 32.3886 32.3655 ...
    32.3747 32.8374 33.5133 36.4568 34.0752];
bar(year,CO2,'blue');
ylim([20 40]);
xlabel('Years');
ylabel('CO2 emission (Gt)');
title('Global CO2 emission (2010-2020)')
grid on;

% %%
% % Example 5.6: Area Plot
% clear; clc;
% 
% % Area plot
% % Data: Typical load curve over 24 hours in MW
% a=xlsread('Area_plot_2.xlsx');
% y=a(:,2:4);
% area(y);
% xlim([0 24]);
% xlabel('Hours');
% ylabel('Load (MW)');
% title('Load curve in MW')
% legend('Base load', 'Shoulder load', 'Peak load', 'Location','northwest');