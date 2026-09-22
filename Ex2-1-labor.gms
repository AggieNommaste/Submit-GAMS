$ontext
CEE 6410 - Water Resources Systems Analysis
Example 2.1 from Bishop Et Al Text (https://digitalcommons.usu.edu/ecstatic_all/76/)
Modifies Example to vehicle problem

T2. Vehicle Production Problem
A motor vehicle company is planning production for the coming year. The company makes
Trucks and Sedans. The company will produce 10,000 vehicles total for the year. Vehicles
have the following components:
The company has purchased 14,000 fuel tanks. Trucks are made with 2 fuel tanks per
vehicle; sedans have just one tank.
The company has purchased 18,000 rows of seats. Trucks have 1 row of seats per vehicle;
sedans have two rows per vehicles.
The company has purchased 6,000 four-wheel drive systems. Trucks are built with 1 four-
wheel drive system per vehicle. Sedans have none.
Trucks generate $100/vehicle while Sedans generate $110/vehicle

THE SOLUTION:
Uses General Algebraic Modeling System to Solve this Linear Program

Ammon Wallace
ammon.wallace@usu.edu
September 21, 2026
$offtext

* 1. DEFINE the SETS
SETS veh vehicles being made /Trucks, Sedans/
     res resources /Fuel_Tanks, Seats, Four_Wheel_Drive, Total/;

* 2. DEFINE input data
PARAMETERS
   c(veh) Objective function coefficients ($ per veh)
         /Trucks 100,
        Sedans 110 /

   b(res) Right hand constraint values (per resource)
          /Fuel_Tanks 14000,
           Seats  18000,
           Four_Wheel_Drive  6000,
           Total 10000/;

TABLE A(veh,res) Left hand side constraint coefficients
                Fuel_Tanks  Seats  Four_Wheel_Drive  Total
 Trucks             2         1           1            1
 Sedans             1         2           0            1;


* 3. DEFINE the variables
VARIABLES X(veh) vehicles produced (Number)
          VPROFIT  total profit ($);

* Non-negativity constraints
POSITIVE VARIABLES X;

* 4. COMBINE variables and data in equations
EQUATIONS
   PROFIT Total profit ($) and objective function value
   RES_CONSTRAIN(res) Resource Constraints;

PROFIT..                 VPROFIT =E= SUM(veh, c(veh)*X(veh));
RES_CONSTRAIN(res) ..    SUM(veh, A(veh,res)*X(veh)) =L= b(res);


* 5. DEFINE the MODEL from the EQUATIONS
MODEL PRODUCTION /PROFIT, RES_CONSTRAIN/;
*Altnerative way to write (include all previously defined equations)
*MODEL PLANTING /ALL/;


* 6. SOLVE the MODEL
* Solve the PLANTING model using a Linear Programming Solver (see File=>Options=>Solvers)
*     to maximize VPROFIT
SOLVE PRODUCTION USING LP MAXIMIZING VPROFIT;


* 6. CLick File menu => RUN (F9) or Solve icon and examine solution report in .LST file
