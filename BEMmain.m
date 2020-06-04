%% BEM Main (WIP)
% written by Sean Wang

clear; clc;


%% Blade Properties
% Hansen Blade Properties (imported from csv)
bladeProp = csvread('hansenBladeProp.csv', 1);
x = bladeProp(:,1);
EI1 = bladeProp(:,3);
EI2 = bladeProp(:,4);
beta = bladeProp(:,11) - bladeProp(:,10);
v = bladeProp(:,10);

m = ones(12); % arbitrary mass values
py = ones(12); % arbitrary load values
pz = ones(12);

%% Straight beam reference case
% xlength = 11;
% x = linspace(0, 1, xlength);
% EI1 = ones(xlength);
% EI2 = ones(xlength);
% beta = zeros(xlength);
% v = zeros(xlength);
% m = ones(xlength);
% py = zeros(xlength);
% pz = ones(xlength);

%% NACA 2412 reference case
ndc = csvread('naca2412.csv', 1);

%% Shitty Rectangle
sR = csvread('shittyrectangle2.csv', 1);
% plot(sR(:,1), sR(:,2))

%% I Beam
IB = csvread('IBeam.csv', 1);

%% Function calls
asdf = deflecfxf(x, EI1, EI2, beta, v, py, pz); % call deflec function
jkl = eigenmode(x, EI1, EI2, beta, v, m); % call eigenmode function
% qwerty = propGenFoil(ndc, 0, 0);
qwerty2 = propGenFoil(sR, 0, 0)
qwerty3 = propGenFoil(IB, 0, 0)

rectangleIzzIyy = ([0.04 * 1^3 / 12, 0.04^3 * 1 / 12])

%% Prints

%% Plotting
%% Y eigenmodes
% figure('name', 'flapwise y')
% for j=2:1:13
%     md = mod(j,2);
%     if md == 0
%         plot(x, jkl(:,j))
%         hold on
%         
%     end
%     for n=1:6
%         leg{n}=sprintf('mode%d',n);
%     end
% end
% legend(leg);
% 
% figure('name', 'flapwise y')
% for j=2:1:13
%     md = mod(j,2);
%     if md == 1
%         plot(x, jkl(:,j))
%         hold on
%         
%     end
%     for n=1:6
%         leg{n}=sprintf('mode%d',n);
%     end
% end
% legend(leg);

%% Z eigenmodes
% figure('name', 'edgewise z')
% for j=14:1:25
%     md = mod(j,2);
%     if md == 0
%         plot(x, jkl(:,j))
%         hold on
%         
%     end
%     for n=1:6
%         leg{n}=sprintf('mode%d',n);
%     end
% end
% legend(leg);
% 
% figure('name', 'edgewise y')
% for j=14:1:25
%     md = mod(j,2);
%     if md == 1
%         plot(x, jkl(:,j))
%         hold on
%         
%     end
%     for n=1:4
%         leg{n}=sprintf('mode%d',n);
%     end
% end
% legend(leg);

%% First eigeinmodes
% for j=1:1
%     figure('name', 'first eigenmodes')
%     plot(x, jkl(:,2))
%     hold on
%     plot(x, jkl(:,3))
%     hold on
%     plot(x, jkl(:,14))
%     hold on
%     plot(x, jkl(:,15))
%     hold on
% 
% end
% legend('flapwise z', 'flapwise y', 'edgewise z', 'edgewise y');

%% Second eigenmodes
% for j=1:1
%     figure('name', 'second eigenmodes')
%     plot(x, jkl(:,4))
%     hold on
%     plot(x, jkl(:,5))
%     hold on
%     plot(x, jkl(:,16))
%     hold on
%     plot(x, jkl(:,17))
%     hold on
%     
% end
% legend('flapwise z', 'flapwise y', 'edgewise z', 'edgewise y');

% plot(ndc(:, 1), ndc(:, 2))
% ylim([-0.3, 0.3]);
