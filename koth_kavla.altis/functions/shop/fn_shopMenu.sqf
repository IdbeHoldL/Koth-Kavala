/*
	File: fn_fetchVehInfo.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private["_store"];

disableSerialization;

_store = [(_this select 0),0,0,[0]] call BIS_fnc_param;

if(!createDialog "koth_shop") exitWith {};


switch (_store) do {

	case 0: {
		ctrlSetText [1002,"Vehicle Shop"];
		_vehicleList = [["B_Heli_Light_01_F"],["B_Heli_Light_01_F"],["B_Heli_Light_01_F"]];
		_control = ((findDisplay 1000) displayCtrl 1003);
		lbClear _control;

		{
			_info = [_x select 0] call KOTH_fnc_fetchVehInfo;
			_control lbAdd format["%1",(_info select 2)];
			_control lbSetPicture [(lbSize _control)-1,(_info select 1)];
			_control lbSetData [(lbSize _control)-1,_info select 0];
			_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
		} foreach _vehicleList;
	};
	case 1: {
		ctrlSetText [1002,"Weapon Shop"];
		_weaponList = [["hgun_Rook40_snds_F"],["hgun_Rook40_snds_F"],["hgun_Rook40_snds_F"]];
		_control = ((findDisplay 1000) displayCtrl 1003);
		lbClear _control;

		{						       
			_info = [_x select 0] call KOTH_fnc_fetchWepInfo;
			_control lbAdd format["%1",(_info select 1)];
			_control lbSetPicture [(lbSize _control)-1,(_info select 2)];
			_control lbSetData [(lbSize _control)-1,_info select 0];
			_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
		} foreach _weaponList;
	};
};