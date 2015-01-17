if (isServer) then 
{		
_request = _this select 0;
_playerUID = _request select 0;
_unit = _request select 1;

_uniformContainer = uniformContainer _unit;
_uniformWeapons = [[],[]];
_uniformItems = [[],[]];
_uniformMagazines = [[],[]];
if (!(isNull _uniformContainer)) then
{
	_uniformWeapons = getWeaponCargo _uniformContainer;
	_uniformItems = getItemCargo _uniformContainer;
	_uniformMagazines = magazinesAmmoCargo _uniformContainer;
}
else
{
	_uniformContainer = "";
};

_vestContainer = vestContainer _unit;
_vestWeapons = [[],[]];
_vestItems = [[],[]];
_vestMagazines = [[],[]];
if (!(isNull _vestContainer)) then
{
	_vestWeapons = getWeaponCargo _vestContainer;
	_vestItems = getItemCargo _vestContainer;
	_vestMagazines = magazinesAmmoCargo _vestContainer;
}
else
{
	_vestContainer = "";
};

_backpackContainer = backpackContainer _unit;
_backpackWeapons = [[],[]];
_backpackItems = [[],[]];
_backpackMagazines = [[],[]];
if (!(isNull _backpackContainer)) then
{
	_backpackWeapons = getWeaponCargo _backpackContainer;
	_backpackItems = getItemCargo _backpackContainer;
	_backpackMagazines = magazinesAmmoCargo _backpackContainer;
}
else
{
	_backpackContainer = "";
};

_uniform = uniform _unit;

if(count (_uniform) == 0) then
{
   _uniform = "";
};

_vest = uniform _unit;

if(count (_vest) == 0) then
{
   _vest = "";
};

_backpack = backpack _unit;

if(count (_backpack) == 0) then
{
   _backpack = "";
};

_goggles = goggles _unit;

if(count (_goggles) == 0) then
{
   _goggles = "";
};

_headgear = headgear _unit;

if(count (_headgear) == 0) then
{
   _headgear = "";
};

_primaryWeapon = primaryWeapon _unit;

if(count (_primaryWeapon) == 0) then
{
   _primaryWeapon = "";
};

_secondaryWeapon = secondaryWeapon _unit;

if(count (_secondaryWeapon) == 0) then
{
   _secondaryWeapon = "";
};

_handgunWeapon = handgunWeapon _unit;

if(count (_handgunWeapon) == 0) then
{
   _handgunWeapon = "";
};

_primaryWeaponItems = primaryWeaponItems _unit;

if(count (_primaryWeaponItems) == 0) then
{
   _primaryWeaponItems = "";
};

_secondaryWeaponItems = secondaryWeaponItems _unit;

if(count (_secondaryWeaponItems) == 0) then
{
   _secondaryWeaponItems = "";
};

_handgunItems = handgunItems _unit;

if(count (_handgunItems) == 0) then
{
   _handgunItems = "";
};

_assignedItems = assignedItems _unit;

if(count (_assignedItems) == 0) then
{
   _assignedItems = "";
};

_loadedMags = [];

{
	_loaded = _x select 2;
	if (_loaded) then
	{
		_mag = _x select 0;
		_ammo = _x select 1;
		_type = _x select 3;

		if (_ammo == 0 && _type != 0) then
		{
			_loadedMags pushBack [_mag, _ammo];
		};

	};
} forEach magazinesAmmoFull _unit;

_query = "updatePlayerSave:" 
+ _playerUID + ":" + str(_uniformWeapons) + ":" + str(_uniformItems) + ":" + str(_uniformMagazines) + ":" 
+ str(_vestWeapons) + ":" + str(_vestItems)	+ ":" + str(_vestMagazines) + ":" + str(_backpackWeapons) + ":" 
+ str(_backpackItems) + ":" + str(_backpackMagazines) + ":" + str(_uniform) + ":" + str(_vest) + ":" + str(_backpack) + ":" 
+ str(_goggles) + ":" + str(_headgear) + ":" + str(_primaryWeapon) + ":" + str(_secondaryWeapon) + ":" + str(_handgunWeapon) + ":" 
+ str(_primaryWeaponItems) + ":" + str(_secondaryWeaponItems) + ":" + str(_handgunItems) + ":" 
+ str(_assignedItems) + ":" + str(_loadedMags);

[_query] spawn async;

diag_log format ["QUERY %1",_query];
};