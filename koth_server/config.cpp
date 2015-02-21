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
	class DB
	{
		tag = "extDB";
		class extDB
		{
			file = "\koth_server\functions\DB";
			class async{};
			class strip{};
		};
	};

	class Player
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
};
