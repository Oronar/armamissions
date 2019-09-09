Vehicle Vending Machines v1.0
By Airlift


There are two files that need to be copied into your mission folder.
1. addVendingMachineAction.sqf
2. addVendingMachineEvent.sqf

By default the RHS yellow smoke grenade is used. These do not interfere with normal use of yellow grenades so the change is mostly aesthetic.

If you wish to use a different type of grenade then you will need to change the _grenadeType variables in each of these files. You will need the object class name for the grenade and the magazine type for the grenade.

For the yellow smoke grenade these are "rhs_mag_m18_yellow" and "rhs_magazine_rhs_mag_m18_yellow" respectively.


To setup the vending machine object you need to add a vending machine prop to the map. Edit its init script to load the vending machine action function and call it for each type of vehicle you want to be able to spawn. You will need the class name for the vehicle and to decide on an action name for each.

Here is an example script that provides four different types of vehicle.

vendingMachine = compile loadFile "addVendingMachineAction.sqf";
["RHS_MELB_MH6M", "Select MH-6"] call vendingMachine;
["B_Heli_Attack_01_dynamicLoadout_F", "Select RAH-66 Comanche"] call vendingMachine;
["B_Heli_Transport_03_F", "Select CH-47 Chinook"] call vendingMachine;
["B_Quadbike_01_F", "Select ATV"] call vendingMachine;


Once a player has spawned a grenade from the machine they have 30 seconds to throw it to spawn the vehicle selected, which will appear near the point of the grenades impact. If 30 seconds has elapsed then the grenade will merely go off normally and spawn nothing.

