/*
	File: fn_shopSelection.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/
private["_control","_index","_className"];
disableSerialization;

_control = _this select 0;
_index = _this select 1;

_className = _control lbData _index;

switch (KOTH_store) do {
	case 0: {
		if(!isNil "KOTH_shopVehicle") then {
			deleteVehicle KOTH_shopVehicle;
			KOTH_shopVehicle = _className createVehicleLocal (getPos SHOP);
			KOTH_shopVehicle allowDamage false;
			KOTH_shopVehicle enableSimulation false;
		};
	};
	case 1: {
		_info = [_className] call KOTH_fnc_fetchCfgInfo;
		
		if(!isNil "KOTH_shopGun") then {deleteVehicle KOTH_shopGun;};
		if ((_info select 4) != "CfgMagazines") then {
			KOTH_shopGun = "groundweaponholder" createVehicleLocal (getPos SHOP);  
			KOTH_shopGun attachTo [SHOP, [0,0,0]];   
			KOTH_shopGun setVectorDirAndUp [[0,0,1],[0,-40,0]];  
			KOTH_shopGun addweaponcargo [_className,1];   
			KOTH_shopGun setDamage 1; 
		};		
	};
	case 2: {
		_info = [_className] call KOTH_fnc_fetchCfgInfo;
	};
};