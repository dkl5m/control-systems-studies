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

%%
% Example 5.7: Surface Plot
% clc; clear; close all;

% % Surface plot
% % Data: Electricity day-ahead market price (2019)
% % LMP: Local Marginal Price ($/MW)
% % Day: Jan-01-2019 to Jan-07-2019
% % Hour: 24 hours
%LMP=xlsread('surface2.xlsx');
% Day=1:7;
% Hour=1:24;
% [DAY,HOUR]=meshgrid(Day,Hour);
% surf(DAY,HOUR,LMP');
% colorbar
% xlabel('Days (Jan 1 - Jan 7)');
% xlabel('Hours');
% xlabel('Price ($/MW)');
% title('Electricity day-ahead market price (2019)');


%%
% Example 5.8: Pie Plot
clc; clear; close all;

% Pie plot
% Data: Electricity consumption by different sectors in USA (2018)
% x: Percentage of consumption in four different sectors in USA
x = [35.4,25.9,2,38.5];
subplot(1,2,1);
pie(x);
title('Without explode feature')
subplot(1,2,1);
explode=[1,1,1,1];
pie(x,explode);
title('With explode feature');
labels = {};
legend(labels,'Location','best');