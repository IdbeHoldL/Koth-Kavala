class DefaultEventhandlers;

class CfgPatches 
{
	class koth_server
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "koth_server.pbo";
		author[]= {"BAROD"}; 
	};
};

class CfgFunctions
{
	class extDB
	{
		tag = "extDB";
		class extDB
		{
			file = "\koth_server\functions\extDB";
			class async{};
			class strip{};
		};
	};

	class player
	{
		tag = "player";
		class player
		{
			file = "\koth_server\functions\player";
			class loadLoadout{};
			class loadStats{};
			class saveLoadout{};
			class saveStats{};
		};
	};
	
	class vehicle
	{
		tag = "vehicle";
		class vehicle
		{
			file = "\koth_server\functions\vehicle";
			class spawnTruck{};
		};
	};
};
