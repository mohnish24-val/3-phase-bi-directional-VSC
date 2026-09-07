clc;
tsim=1; % simulation time
% Given parameters
rg=10e-3; % filter ESR per phase
Lg=2e-3; % filter L value per phase
rdson=20e-3; % Rds,on of each MOSFET
Vdc=800; % DC link voltage
mmax=0.99; % max limit on modulation index m
mmin=-0.99; % min limit on modulation index m
Vph=400; % rated line-line voltage
fs=50; % nominal power frequency of the grid

% Roll number fixed to ee25mtech14018 (input prompt removed)
fsw=35e3;
Vg1=428;  P1=-5e3;
Vg2=438;  P2=1e3;
Vg3=438;  P3=5e3;
Vg4=438;  P4=-5e3;

fsw
samples_per_switching=100;
tsamp=1/(samples_per_switching*fsw);
% PFC grid current controller design
req=rg+rdson; % equivalent resistance in filter path
Kp=2*pi*fsw*Lg/10 % pole zero cancellation
Ki=2*pi*fsw*req/10
% Reference frame transformation selection
invr=1; % invr=1 for voltage magnitude invariance and 2 for power magnitude invariance
if invr==1
    kd=2/3;
    kq=2/3;
    ko=1/3;
else
    kd=sqrt(2/3);
    kq=sqrt(2/3);
    ko=sqrt(1/3);
end
k1=2/(3*kd);
k2=2/(3*kq);
k3=1/(3*ko);
conv=4; % convention 1,2,3,4. select 2 or 4 to have Q=0
if conv==1
    PHI=0;
    sig=1;
elseif conv==2
    PHI=pi/2;
    sig=1;
elseif conv==3
    PHI=0;
    sig=-1;
else
    PHI=-pi/2;
    sig=-1;
end