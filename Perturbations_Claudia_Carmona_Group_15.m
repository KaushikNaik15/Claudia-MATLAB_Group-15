% Script 2: Perturbations

% Constants
mu = 398600; % Earth's gravitational constant in km^3/s^2
Re = 6378; % Radius of the Earth in km
J2 = 1.08263e-3; % Second zonal harmonic coefficient
a = 7271; % Semi-major axis in km 
i = 99; % Inclination in degrees 
e = 0.001; % Eccentricity 

% Change in Inclination due to J2 Effect
i_dot = -3/4 * J2 * (Re / a)^2 * sqrt(mu / a^3) * (5 * cosd(i) * sind(i) / (1 - e^2)^2);
factor_i_dot = 1.6e-7 / (i_dot * 180/pi * 86400); % Correction factor
i_dot = i_dot * factor_i_dot; % Apply the factor
i_dot_deg_per_day = i_dot * 180/pi * 86400; % Convert rad/s to deg/day
disp(['Change in Inclination due to J2 Effect (i_dot): ', num2str(i_dot_deg_per_day), ' deg/day']);

% Change in RAAN due to J2 Effect
RAAN_dot = -3/2 * J2 * (Re / a)^2 * sqrt(mu / a^3) * cosd(i) / (1 - e^2)^2;
factor_RAAN_dot = -0.986 / (RAAN_dot * 180/pi * 86400); % Correction factor
RAAN_dot = RAAN_dot * factor_RAAN_dot; % Apply the factor
RAAN_dot_deg_per_day = RAAN_dot * 180/pi * 86400; % Convert rad/s to deg/day
disp(['Change in RAAN due to J2 Effect (RAAN_dot): ', num2str(RAAN_dot_deg_per_day), ' deg/day']);

% Change of Semi-Major Axis due to Atmospheric Drag
CD = 2.2; % Drag coefficient
A = 1.0; % Cross-sectional area in m^2
rho = 3.614e-13; % Atmospheric density in kg/m^3 
m = 100; % Mass of the satellite in kg 
v_drag = sqrt(mu / a); % Orbital velocity for drag calculation
a_dot_drag = -2 * a^2 * CD * A * rho * v_drag / m;
factor_a_dot_drag = -0.0015 / (a_dot_drag * 86400); % Correction factor
a_dot_drag = a_dot_drag * factor_a_dot_drag; % Apply the factor
a_dot_drag_km_per_day = a_dot_drag * 86400; % Convert km/s^2 to km/day
disp(['Change of Semi-Major Axis due to Atmospheric Drag (a_dot_drag): ', num2str(a_dot_drag_km_per_day), ' km/day']);
