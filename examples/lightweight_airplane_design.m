% This script follows the MathWorks "Lightweight Airplane Design" tutorial,
% which can be found here:
% https://www.mathworks.com/help/aeroblks/lightweight-airplane-design.html

clear variables;
clc;

%% Defining Vehicle Geometry
% The original design objective for this geometry was a four-seat general
% aviation aircraft that was safe, simple to fly, and easily maintainable
% with specific mission and performance constraints.

% For the aircraft flight control, rate of climb is the design requirement
% and assumed to be greater than 2 meters per second (m/s) at 2,000 meters.

% This corresponds to the geometry in the built-in 'astdatcom.in' file.

%% Determining Vehicle Aerodynamic Characteristics
% Running the 'astdatcom.in' file through the digital datcom program (not
% provided in this repository, produces a result identical to the built-in
% 'astdatcom.out'the file.

% Now, the data from this file is imported.
alldata = datcomimport('astdatcom.out', true, 0);
data = alldata{1};

% Plot the pitching coefficent vs. angle of attack graphs for each mach
% condition. See:
% https://www.mathworks.com/help/aerotbx/ug/importing-digital-datcom-data.html
% for more information on this code.
h3 = figure;
figtitle = {'Pitching Coefficient vs. Angle of Attack' ''};
for k=1:2
    subplot(2,1,k)
    plot(data.alpha,permute(data.cm(:,k,:),[1 3 2]))
    grid
    ylabel(['Pitching Coefficient (Mach =' num2str(data.mach(k)) ')'])
    title(figtitle{k})
end
xlabel('Angle of Attack (deg)')

%% Creating Flight Vehicle Simulation/Designing Flight Control Laws
% Once we determine aerodynamic stability and control derivatives, we can
% build an open-loop plant model to evaluate the aircraft longitudinal
% dynamics.

% A typical plant model includes the following components:
% Equations of motion: calculate vehicle position and attitude from forces
% and moments
% Forces and moments: calculate aerodynamic, gravity, and thrust forces and
% moments
% Actuator positions: calculate displacements based on actuator commands
% Environment: include environmental effects of wind disturbances, gravity,
% and atmosphere
% Sensors: model the behavior of the measurement devices

% Open the 3DOF aircraft flight control example template.
asbFlightControlAnalysis('3DOF');

% TODO: Run through the '3DOF' live script tutorial.

% Open the 6DOF aircraft flight control example template.
asbFlightControlAnalysis('6DOF');

% TODO: Run through the '6DOF' live script tutorial.

%% Completing the Design Process
% The next steps involve:
% Building a hardware-in-the-loop system to test real-time performance
% Building the actual vehicle hardware and software
% Conducting the flight test
% Analyzing and visualizing the flight test data.

% Because these steps are not the focus of this example, we will not
% describe them here. Instead, we will simply mention that they can all be
% streamlined and simplified using the appropriate tools, such as Embedded
% Coder, Simulink Real-Time, and Aerospace Toolbox software.

%% References/Further Reading
% Cannon, M, Gabbard, M, Meyer, T, Morrison, S, Skocik, M, Woods, D.
%   "Swineworks D-200 Sky Hogg Design Proposal." AIAA/General Dynamics
%   Corporation Team Aircraft Design Competition, 1991-1992.
% Turvesky, A., Gage, S., and Buhr, C., "Accelerating Flight Vehicle
%   Design", MATLAB Digest, January 2007.
% Turvesky, A., Gage, S., and Buhr, C., "Model-based Design of a New
%   Lightweight Aircraft", AIAA paper 2007-6371, AIAA Modeling and
%   Simulation Technologies Conference and Exhibit, Hilton Head, South
%   Carolina, Aug. 20-23, 2007.
