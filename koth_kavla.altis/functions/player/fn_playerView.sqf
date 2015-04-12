/*
	File: fn_playerView.sqf
	Author: BAROD
	Description:
		Forces First Person View unless in Vehicle
	Parameters:
		NONE
*/

if (difficultyEnabled "3rdPersonView") then {
	while {true} do {
		if (cameraView isEqualto "External") then {
			if ((vehicle player) isEqualto player) then {
				player switchCamera "Internal";
			}
			else
			{
				if (typeOf(vehicle player) isEqualto "Steerable_Parachute_F") then {
					(vehicle player) switchCamera "Internal";
				};
			};
		};
		uisleep 0.1;
	};
};