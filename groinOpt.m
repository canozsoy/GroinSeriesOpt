clc
clear
close all
tic

%{

This code calculates the optimized Xg/Yg ratio for specified area of groin
series.

It takes area length, initial groin length, adjacent groin tip angle and 
ratio interval as input.

cumSpace outpul should be analyzed for determining Xg/Yg ratio, grLength
gives groin length and space will give spaces between groins.

C.Özsoy (2020)

%}

%% Inputs

areaLength=935;                                                             % Area length in meter
iniGrLength=30;                                                             % Initial groin length
adjGrAngle=6;                                                               % Angle between adjacent groin tip (CEM suggest 6 degree)
ratio=2:0.01:3;                                                             % Xg/Yg ratio (CEM suggest between 2-3)

%% Calculation

alfa=deg2rad(adjGrAngle);

for i=ratio
    index=find(ratio==i);
    k=1;
    cumSpace(index,k)=0;
    grLength(index,k)=iniGrLength;
    while cumSpace(index,k)<areaLength
        space(index,k)=i*grLength(index,k);
        diff(index,k)=tan(alfa)*space(index,k);
        grLength(index,k+1)=grLength(index,k)+diff(index,k);
        cumSpace(index,k+1)=cumSpace(index,k)+space(index,k);
        k=k+1;
    end
end

toc

