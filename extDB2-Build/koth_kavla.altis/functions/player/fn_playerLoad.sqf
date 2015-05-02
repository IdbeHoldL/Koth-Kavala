/*
	File: fn_playerLoad.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/
private["_stats"];

0 cutText["Setup Loadout","BLACK FADED"];
0 cutFadeOut 9999999;
diag_log str _this;

_stats = missionNamespace setVariable ["player_stats",(_this select 0)];
_loadout = _this select 1;

if (count _loadout != 0) then {
	_headgear = _loadout select 0;
	_goggles = _loadout select 1;
	_uniform = _loadout select 2;
	_vest = _loadout select 3;
	_backpack = _loadout select 4;
	_primaryWeapon = _loadout select 5;
	_secondaryWeapon = _loadout select 6;
	_handgunWeapon = _loadout select 7;
	_primaryWeaponItems = _loadout select 8;
	_secondaryWeaponItems = _loadout select 9;
	_handgunItems = _loadout select 10;
	_assignedItems = _loadout select 11;

	_uniformWeapons = _loadout select 12;
	_uniformItems = _loadout select 13;
	_uniformMagazines = _loadout select 14;

	_vestWeapons = _loadout select 15;
	_vestItems = _loadout select 16;
	_vestMagazines = _loadout select 17;

	_backpackWeapons = _loadout select 18;
	_backpackItems = _loadout select 19;
	_backpackMagazines = _loadout select 20;

	_loadedMagazines = _loadout select 21;
	
	removeAllWeapons player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadgear player;
	sleep 0.1;

	if (_headgear != "") then {
		player addHeadgear _headgear;
	};

	if (_headgear != "") then {
		player addGoggles _goggles;
	};

	if (_uniform != "") then {
		player addUniform _uniform;
	};

	if (_vest != "") then {
		player addVest _vest;
	};

	if (_vest != "") then {
		player addBackpack _backpack;
	};

	{
		player removeItemFromBackpack _x;
	} forEach backpackItems player;

	_uniformContainer = uniformContainer player;
	_vestContainer = vestContainer player;
	_backpackContainer = backpackContainer player;
	if (_uniform != "") then {
		{
			_uniformContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
		} forEach _loadedMagazines;
	};
	
	player addWeapon _primaryWeapon;
	player addWeapon _secondaryWeapon;
	player addWeapon _handgunWeapon;
	removeAllPrimaryWeaponItems player;
	removeAllHandgunItems player;

	{
		if (_x != "") then {
			player addPrimaryWeaponItem _x;
		};
	} forEach _primaryWeaponItems;
	{
		if (_x != "") then {
			player addPrimaryWeaponItem _x;
		};
	} forEach _secondaryWeaponItems;
	{
		if (_x != "") then {
			player addHandgunItem _x;
		};
	} forEach _handgunItems;
	{
		if (_x != "") then {
			player linkItem _x;
		};
	} forEach _assignedItems;
	
	{
		_uniformContainer addWeaponCargoGlobal [_x, (_uniformWeapons select 1) select _forEachIndex];
	} forEach (_uniformWeapons select 0);
	{
		_uniformContainer addItemCargoGlobal [_x, (_uniformItems select 1) select _forEachIndex];
	} forEach (_uniformItems select 0);
	{
		if ((count _x) > 0) then {
			_uniformContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
		};
	} forEach _uniformMagazines;

	{
		_vestContainer addWeaponCargoGlobal [_x, (_vestWeapons select 1) select _forEachIndex];
	} forEach (_vestWeapons select 0);
	{
		_vestContainer addItemCargoGlobal [_x, (_vestItems select 1) select _forEachIndex];
	} forEach (_vestItems select 0);
	{
		if ((count _x) > 0) then {
			_vestContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
		};
	} forEach _vestMagazines;

	{
		_backpackContainer addWeaponCargoGlobal [_x, (_backpackWeapons select 1) select _forEachIndex];
	} forEach (_backpackWeapons select 0);
	{
		_backpackContainer addItemCargoGlobal [_x, (_backpackItems select 1) select _forEachIndex];
	} forEach (_backpackItems select 0);
	{
		if ((count _x) > 0) then {
			_backpackContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
		};
	} forEach _backpackMagazines;
};

0 cutText ["","BLACK IN"];	