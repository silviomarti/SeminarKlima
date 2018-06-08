%% Startvariablen, Timebase, konstante Temp

y0 = [0; 0; 0; 0.035; 0.04; 0.032;];
tspan = [0 900000];
val = [7;19; 7; 0.035;0.04; 0.035];

%% L�sung Diffgl
[t,y] = ode45(@(t,y) odefun_3box(t,y,val), tspan, y0);

%% Plot Temperature
figure(1)
plot(t,y(:,1));
hold on
plot(t,y(:,2));
plot(t,y(:,3));
hold off
title('Temperature-plot')
xlabel('time')
ylabel('Temp(C)')
legend('T1', 'T2', 'T3')

%% Plot Salinity
figure(2);
plot(t,y(:,4));
hold on
plot(t,y(:,5));
plot(t,y(:,6));
hold off
title('Salinity-plot')
xlabel('time')
ylabel('Salinity(...)')
legend('S1', 'S2', 'S3')

%% Berechnung Fluss
k = 1.5*10^(-6);
a = 1.5*10^(-4);
b = 8*10^(-4);
q1 = k*(a*(y(:,2)-y(:,1))-b*(y(:,4)-y(:,3)));
q2 = k*(a*(y(:,3)-y(:,2))-b*(y(:,6)-y(:,5)));

%% Plot Fluss
figure(3) 
plot(t,q1);
hold on
plot(t, q2);
hold off
title('Fluss-plot')
xlabel('time')
ylabel('Fluss')
legend('q1', 'q2')
