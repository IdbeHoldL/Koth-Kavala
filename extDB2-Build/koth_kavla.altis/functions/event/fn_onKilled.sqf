/*
	File: fn_onKilled.sqf
	Author: BAROD

	Description:
		Trigger when client Dies.

	Parameters:
		0: unit: Object
		1: killer: Object
*/

private["_unit","_killer"];

_unit = _this select 0;
_killer = _this select 1;

SURVIVAL_deathScreem  = "CAMERA" camCreate (getPosWorld _unit);
showCinemaBorder false;
SURVIVAL_deathScreem cameraEffect ["Internal","Back"];
SURVIVAL_deathScreem camSetTarget _unit;
SURVIVAL_deathScreem camSetRelPos [0,3.5,4.5];
SURVIVAL_deathScreem camSetFOV .5;
SURVIVAL_deathScreem camSetFocus [50,0];
SURVIVAL_deathScreem camCommit 0;	


if (_revive) then {
	setPlayerRespawnTime 600;
	createDialog "KOTH_RespawnDialog";
} else {
	setPlayerRespawnTime 15;
};

[] spawn{
	while {!alive player} do {
		if (playerRespawnTime <= 15) exitWith{ closeDialog 0; };
		if (!dialog) then{
			createDialog "KOTH_RespawnDialog";
		};
		sleep 1;
	};
};
