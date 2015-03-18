_data = _this select 0;

_headgear = _data select 0;
_goggles = _data select 1;

_uniform = _data select 2;
_vest = _data select 3;
_backpack = _data select 4;

_uniformWeapons = _data select 5;
_uniformItems = _data select 6;
_uniformMagazines = _data select 7;

_vestWeapons = _data select 8;
_vestItems = _data select 9;
_vestMagazines = _data select 10;

_backpackWeapons = _data select 11;
_backpackItems = _data select 12;
_backpackMagazines = _data select 13;

_primaryWeapon = _data select 14;
_secondaryWeapon = _data select 15;
_handgunWeapon = _data select 16;

_primaryWeaponItems = _data select 17;
_secondaryWeaponItems = _data select 18;
_handgunItems = _data select 19;
_assignedItems = _data select 20;

_loadedMagazines = _data select 21;

removeAllWeapons player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

sleep 0.1;

player addHeadgear _headgear;
player addGoggles _goggles;

player addUniform _uniform;
player addVest _vest;
player addBackpack _backpack;

{
	player removeItemFromBackpack _x;
} forEach backpackItems player;


_uniformContainer = uniformContainer player;
_vestContainer = vestContainer player;
_backpackContainer = backpackContainer player;
	
if (_uniform != "") then
{
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
	if (_x != "") then
	{
		player addPrimaryWeaponItem _x;
	};
} forEach _primaryWeaponItems;

{
	if (_x != "") then
	{
		player addPrimaryWeaponItem _x;
	};
} forEach _secondaryWeaponItems;

{
	if (_x != "") then
	{
		player addHandgunItem _x;
	};
} forEach _handgunItems;

{
	if (_x != "") then
	{
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
	if ((count _x) > 0) then
	{
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
	if ((count _x) > 0) then
	{
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
	if ((count _x) > 0) then
	{
			_backpackContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	};
} forEach _backpackMagazines;

