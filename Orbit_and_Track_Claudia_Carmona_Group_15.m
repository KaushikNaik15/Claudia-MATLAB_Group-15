% Script 1: Orbit calculation

% Constants
mu = 398600; % Earth's gravitational constant in km^3/s^2
Re = 6378; % Radius of the Earth in km

% Parameters for final orbit
a = 7271; % Semi-major axis in km
i = 99; % Inclination in degrees
e = 0.001; % Eccentricity

% Calculations
fprintf('Parameters of the Final Orbit:\n');
fprintf('a = %.0f km\n', a);
fprintf('i = %.0f°\n', i);
fprintf('e = %.4f\n\n', e);

% Orbital Period
Torb = 2 * pi * sqrt(a^3 / mu); % Orbital period in seconds
Torb_min = Torb / 60; % Orbital period in minutes
fprintf('Orbital Period (Torb): %.2f minutes\n', Torb_min);

% Orbital Velocity
v = sqrt(mu / a); % Orbital velocity in km/s
fprintf('Orbital Velocity (v): %.2f km/s\n', v);


% Length of the Ground Track
L = v * Torb; % Length of the ground track in km
fprintf('Length of the Ground Track (L): %.2f km\n', L);

% Longitude Variation
Delta_lambda = 360 * Torb / Tearth; % Longitude variation in degrees
fprintf('Longitude Variation (Δλ): %.2f°\n\n', Delta_lambda);

% Ground Track Angle
alpha = 102.99; % Given value
fprintf('Ground Track Angle (α): %.2f°\n', alpha);

% Maximum Latitude
phi_max = 180 - i; % Maximum latitude in degrees
fprintf('Maximum Latitude (φ_max): %.2f°\n', phi_max);

% Inclination Change Calculation
delta_i = 99 - 97.8; % Change in inclination in degrees
v_orb = sqrt(mu / a); % Orbital velocity
delta_v_i = 2 * v_orb * sind(delta_i / 2);
fprintf('Delta-v for Inclination Change (Δv_i): %.4f km/s\n\n', delta_v_i);

% Hohmann Transfer Calculations
r1 = 6978; % Initial semi-major axis in km
r2 = 7271; % Final semi-major axis in km

delta_v1 = sqrt(mu / r1) * (sqrt(2 * r2 / (r1 + r2)) - 1);
delta_v2 = sqrt(mu / r2) * (1 - sqrt(2 * r1 / (r1 + r2)));
delta_v_hohmann = delta_v1 + delta_v2;
fprintf('Hohmann Transfer Delta-v1: %.4f km/s\n', delta_v1);
fprintf('Hohmann Transfer Delta-v2: %.4f km/s\n', delta_v2);
fprintf('Total Hohmann Transfer Delta-v: %.4f km/s\n\n', delta_v_hohmann);

% Transfer Time for Hohmann Transfer
at = (r1 + r2) / 2; % Semi-major axis of the transfer orbit
Tt = 2 * pi * sqrt(at^3 / mu); % Period of the transfer orbit in seconds
t_transfer = Tt / 2; % Transfer time in seconds
fprintf('Transfer Time for Hohmann Transfer: %.2f minutes\n', t_transfer / 60);
